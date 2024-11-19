//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013->  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===-----------------------------------------------------------------------===//

#include "SVF-LLVM/LLVMUtil.h"
#include "SVF-LLVM/ICFGBuilder.h"
#include "SVF-LLVM/SVFIRBuilder.h"
#include "Util/CommandLine.h"
#include "Util/Options.h"
#include "Graphs/ICFG.h"

#include <iostream>
#include <vector>
#include <stack>
#include <set>
#include <map>

using namespace llvm;
using namespace std;
using namespace SVF;

static llvm::cl::opt<std::string> InputFilename(cl::Positional,
        llvm::cl::desc("<input bitcode>"), llvm::cl::init("-"));

class ReachabilityAnalyzer {
private:
    ICFG* icfg;
    map<const ICFGNode*, bool> visited;
    vector<const ICFGNode*> currentPath;
    map<const ICFGNode*, set<const ICFGNode*>> cycleNodes;

    bool detectCycle(const ICFGNode* node) {
        auto it = find(currentPath.begin(), currentPath.end(), node);
        if (it != currentPath.end()) {
            // Found a cycle
            set<const ICFGNode*> cycle;
            for (auto iter = it; iter != currentPath.end(); ++iter) {
                cycle.insert(*iter);
            }
            cycleNodes[*it] = cycle;
            return true;
        }
        return false;
    }

    string formatPath(const vector<const ICFGNode*>& path) {
        string result;
        bool inCycle = false;
        const ICFGNode* cycleStart = nullptr;

        for (size_t i = 0; i < path.size(); i++) {
            const ICFGNode* node = path[i];

            // Check if this node starts a cycle
            if (!inCycle && cycleNodes.find(node) != cycleNodes.end()) {
                inCycle = true;
                cycleStart = node;
                result += "Cycle[";
                const auto& cycleSet = cycleNodes[node];
                bool first = true;
                for (const auto& cycleNode : cycleSet) {
                    if (!first) result += " -> ";
                    result += to_string(cycleNode->getId());
                    first = false;
                }
                result += "]";
            } 
            // If not in cycle or at cycle end, print normally
            else if (!inCycle) {
                if (!result.empty() && result.back() != ']') 
                    result += " -> ";
                result += to_string(node->getId());
            }

            // Check if we're at cycle end
            if (inCycle && node == cycleStart) {
                inCycle = false;
            }
        }
        return result;
    }

    void findPaths(const ICFGNode* current, const ICFGNode* target,
                   vector<const ICFGNode*>& path,
                   vector<vector<const ICFGNode*>>& allPaths) {
        
        if (current == target) {
            allPaths.push_back(path);
            return;
        }

        visited[current] = true;
        currentPath.push_back(current);

        // Get all outgoing edges
        for (const ICFGEdge* edge : current->getOutEdges()) {
            const ICFGNode* succ = edge->getDstNode();
            
            if (!visited[succ] || succ == target) {
                detectCycle(succ);
                path.push_back(succ);
                findPaths(succ, target, path, allPaths);
                path.pop_back();
            }
        }

        visited[current] = false;
        currentPath.pop_back();
    }

public:
    ReachabilityAnalyzer(ICFG* g) : icfg(g) {}

    void analyze(const FunEntryICFGNode* start, const FunEntryICFGNode* end) {
        if (!start || !end) {
            cout << "Unreachable" << endl;
            return;
        }

        vector<const ICFGNode*> path;
        vector<vector<const ICFGNode*>> allPaths;
        path.push_back(start);
        
        findPaths(start, end, path, allPaths);

        if (allPaths.empty()) {
            cout << "Unreachable" << endl;
        } else {
            cout << "Reachable" << endl;
            for (const auto& p : allPaths) {
                cout << formatPath(p) << endl;
            }
        }
    }
};

int main(int argc, char ** argv) {
    int arg_num = 0;
    char **arg_value = new char*[argc];
    std::vector<std::string> moduleNameVec;
    SVF::LLVMUtil::processArguments(argc, argv, arg_num, arg_value, moduleNameVec);
    cl::ParseCommandLineOptions(arg_num, arg_value,
                              "Whole Program Points-to Analysis\n");

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
    SVFIRBuilder *builder = new SVFIRBuilder(svfModule);
    SVFIR* pag = builder->build();
    ICFG* icfg = pag->getICFG();

    FunEntryICFGNode* start = icfg->getFunEntryICFGNode(svfModule->getSVFFunction("src"));
    FunEntryICFGNode* end = icfg->getFunEntryICFGNode(svfModule->getSVFFunction("sink"));

    ReachabilityAnalyzer analyzer(icfg);
    analyzer.analyze(start, end);

    delete builder;
    delete[] arg_value;
    SVFIR::releaseSVFIR();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    llvm::llvm_shutdown();

    return 0;
}
