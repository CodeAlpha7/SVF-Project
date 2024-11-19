#include <stdio.h>

void sink() {
    puts(":)");
}

void src() {
    // First cycle
    int i = 3;
    while(i > 0) {
        i--;
    }
    
    // Immediately followed by second cycle
    while(i < 3) {
        i++;
    }
    
    sink();
}

int main() {
    src();
    return 0;
}