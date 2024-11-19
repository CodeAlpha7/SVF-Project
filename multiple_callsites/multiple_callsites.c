#include <stdio.h>
void sink() {
    puts(":)");
}

void src(){

}

int main() {
    src();
    sink();
}

void f() {
    sink();
    src();
}