#include <stdio.h>
void sink() {
    puts(":)");
}

void src(){
    int i = 10;
    while(i != 0){
        i--;
    }
    sink();
}

int main() {
    src();
}