#include <stdio.h>

void sink() {
    puts(":)");
}

typedef enum {
    STATE_INIT,
    STATE_PROCESS,
    STATE_COMPUTE,
    STATE_VALIDATE,
    STATE_CLEANUP,
    STATE_FINISH
} State;

void processState(State* state, int* data) {
    int counter = 10;
    while(counter > 0) {
        switch(*state) {
            case STATE_INIT:
                for(int i = 0; i < counter; i++) {
                    data[i] = i;
                    int j = i;
                    while(j > 0) {
                        data[j] += data[j-1];
                        j--;
                    }
                }
                *state = STATE_PROCESS;
                break;
                
            case STATE_PROCESS:
                for(int i = 0; i < counter; i++) {
                    int sum = 0;
                    int j = 0;
                    while(j <= i) {
                        sum += data[j];
                        j++;
                    }
                    data[i] = sum;
                }
                *state = STATE_COMPUTE;
                break;
                
            case STATE_COMPUTE:
                for(int i = counter-1; i >= 0; i--) {
                    int product = 1;
                    while(product < data[i]) {
                        product *= 2;
                    }
                    data[i] = product;
                }
                *state = STATE_VALIDATE;
                break;
                
            case STATE_VALIDATE:
                for(int i = 0; i < counter/2; i++) {
                    int temp = data[i];
                    data[i] = data[counter-1-i];
                    data[counter-1-i] = temp;
                }
                *state = STATE_CLEANUP;
                break;
                
            case STATE_CLEANUP:
                while(counter > 0) {
                    data[counter-1] = 0;
                    counter--;
                }
                *state = STATE_FINISH;
                break;
                
            case STATE_FINISH:
                counter = 0;
                break;
        }
    }
}

void src() {
    State state = STATE_INIT;
    int data[10] = {0};
    
    while(state != STATE_FINISH) {
        processState(&state, data);
    }
    
    sink();
}

int main() {
    src();
    return 0;
}