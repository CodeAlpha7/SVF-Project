#include <stdio.h>

void sink() {
    puts(":)");
}

void src() {
    int choice = 1;
    
    // First path with cycle
    if(choice > 0) {
        int i = 5;
        while(i > 0) {
            i--;
        }
    }
    
    // Second path with cycle
    else {
        int j = 3;
        while(j > 0) {
            j--;
        }
    }
    
    sink();
}

int main() {
    src();
    return 0;
}