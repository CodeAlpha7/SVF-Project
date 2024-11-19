#include <stdio.h>

void sink() {
    puts(":)");
}

void src() {
    // First cycle
    int i = 5;
    while(i > 0) {
        i--;
    }

    // Some intermediate code
    int x = 10;
    
    // Second cycle
    int j = 3;
    while(j > 0) {
        j--;
    }
    
    sink();
}

int main() {
    src();
    return 0;
}