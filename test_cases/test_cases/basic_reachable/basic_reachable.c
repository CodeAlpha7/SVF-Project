#include <stdio.h>
void sink() {
    puts(":)");
}

void src(){
    sink();
}

int main() {
    src();
}