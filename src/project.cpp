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
<<<<<<< HEAD
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
=======
    vector<vector<const ICFGNode*>> cycles;

    // New: Track which nodes are entry points for cycles
    map<const ICFGNode*, vector<const ICFGNode*>> cycleEntries;

    void detectCycle(const ICFGNode* node) {
        auto it = find(currentPath.begin(), currentPath.end(), node);
        if (it != currentPath.end()) {
            vector<const ICFGNode*> cycleNodes;
            
            // Record cycle nodes
            for (auto iter = it; iter != currentPath.end(); ++iter) {
                cycleNodes.push_back(*iter);
            }
            cycleNodes.push_back(node);  // Complete the cycle
            
            cycles.push_back(cycleNodes);
            cycleEntries[*it] = cycleNodes;  // Store with cycle entry point
            
            cout << "Found cycle starting at " << (*it)->getId() << endl;
        }
>>>>>>> Complete codebase
    }

    string formatPath(const vector<const ICFGNode*>& path) {
        string result;
<<<<<<< HEAD
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
=======
        size_t i = 0;
        
        while (i < path.size()) {
            const ICFGNode* node = path[i];
            
            // Check if this node is a cycle entry point
            auto cycleIt = cycleEntries.find(node);
            if (cycleIt != cycleEntries.end()) {
                // We found a cycle starting at this node
                if (!result.empty()) result += "->";
                
                // Format the cycle
                result += "Cycle[";
                const auto& cycleNodes = cycleIt->second;
                
                for (size_t j = 0; j < cycleNodes.size(); j++) {
                    result += to_string(cycleNodes[j]->getId());
                    if (j < cycleNodes.size() - 1) result += "->";
                }
                result += "]";
                
                // Skip nodes that are part of this cycle in the main path
                while (i < path.size() && 
                       find(cycleNodes.begin(), cycleNodes.end(), path[i]) != cycleNodes.end()) {
                    i++;
                }
                i--; // Adjust for loop increment
            } else {
                if (!result.empty()) result += "->";
                result += to_string(node->getId());
            }
            
            i++;
        }
        
>>>>>>> Complete codebase
        return result;
    }

    void findPaths(const ICFGNode* current, const ICFGNode* target,
                   vector<const ICFGNode*>& path,
                   vector<vector<const ICFGNode*>>& allPaths) {
        
        if (current == target) {
<<<<<<< HEAD
=======
            // When we find target, make a complete copy including cycle info
>>>>>>> Complete codebase
            allPaths.push_back(path);
            return;
        }

        visited[current] = true;
        currentPath.push_back(current);

<<<<<<< HEAD
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
=======
        for (const ICFGEdge* edge : current->getOutEdges()) {
            const ICFGNode* succ = edge->getDstNode();
            
            // Allow revisiting nodes that could be part of cycles
            if (!visited[succ] || succ == target || 
                find(currentPath.begin(), currentPath.end(), succ) != currentPath.end()) {
                
                // Check for cycle before processing
                detectCycle(succ);
                
                // Only proceed with unvisited or target nodes
                if (!visited[succ] || succ == target) {
                    path.push_back(succ);
                    findPaths(succ, target, path, allPaths);
                    path.pop_back();
                }
            }
        }

        currentPath.pop_back();
        visited[current] = false;
>>>>>>> Complete codebase
    }

public:
    ReachabilityAnalyzer(ICFG* g) : icfg(g) {}

    void analyze(const FunEntryICFGNode* start, const FunEntryICFGNode* end) {
        if (!start || !end) {
            cout << "Unreachable" << endl;
            return;
        }

<<<<<<< HEAD
        vector<const ICFGNode*> path;
        vector<vector<const ICFGNode*>> allPaths;
        path.push_back(start);
        visited.clear();
        currentPath.clear();
        cycles.clear();
        cycleEntries.clear();
        
        vector<const ICFGNode*> path;
        vector<vector<const ICFGNode*>> allPaths;
        
        path.push_back(start);
>>>>>>> Complete codebase
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
