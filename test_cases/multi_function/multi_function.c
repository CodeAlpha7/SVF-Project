#include <stdio.h>

void sink() {
    puts(":)");
}

void complexLoop1(int n) {
    int i = n;
    while(i > 0) {
        int j = i;
        while(j > 0) {
            int k = j;
            while(k > 0) {
                k--;
            }
            j--;
        }
        i--;
    }
}

void complexLoop2(int n) {
    for(int i = 0; i < n; i++) {
        for(int j = i; j < n; j++) {
            int k = 0;
            while(k < i + j) {
                k++;
            }
        }
    }
}

void helperFunction(int x) {
    int count = x;
    while(count > 0) {
        if(count % 2 == 0) {
            int temp = count;
            while(temp > 0) {
                temp--;
            }
        } else {
            int temp = 0;
            while(temp < count) {
                temp++;
            }
        }
        count--;
    }
}

void src() {
    int choice = 5;
    
    // First complex path
    if(choice > 3) {
        complexLoop1(3);
        int i = 0;
        while(i < choice) {
            helperFunction(i);
            i++;
        }
        sink();
    } 
    // Second complex path
    else if(choice > 1) {
        complexLoop2(4);
        for(int i = 0; i < choice; i++) {
            int j = 0;
            while(j < i) {
                helperFunction(j);
                j++;
            }
        }
        sink();
    }
    // Third complex path
    else {
        int i = choice;
        while(i >= 0) {
            complexLoop1(i);
            complexLoop2(i);
            i--;
        }
        sink();
    }
}

int main() {
    src();
    return 0;
}