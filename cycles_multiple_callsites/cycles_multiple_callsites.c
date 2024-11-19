#include <stdio.h>

void sink() {
    puts(":)");
}

void helperWithCycle() {
    int i = 3;
    while(i > 0) {
        i--;
    }
    sink();
}

void src() {
    int j = 2;
    while(j > 0) {
        j--;
    }
    
    if(j == 0) {
        helperWithCycle();  // First call site to sink
    } else {
        sink();  // Second call site to sink
    }
}

int main() {
    src();
    return 0;
}