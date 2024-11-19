#include <stdio.h>

void sink() {
    puts(":)");
}

int processData(int* arr, int size) {
    int result = 0;
    for(int i = 0; i < size; i++) {
        int temp = 0;
        for(int j = i; j < size; j++) {
            int k = 0;
            while(k < arr[j]) {
                if(k % 2 == 0) {
                    int m = k;
                    while(m > 0) {
                        temp += m;
                        m--;
                    }
                } else {
                    int m = 0;
                    while(m < k) {
                        temp -= m;
                        m++;
                    }
                }
                k++;
            }
        }
        result += temp;
    }
    return result;
}

void transformData(int* arr, int size) {
    for(int i = 0; i < size; i++) {
        int j = 0;
        while(j < arr[i]) {
            int k = j;
            while(k > 0) {
                if(arr[k] > arr[k-1]) {
                    int temp = arr[k];
                    arr[k] = arr[k-1];
                    arr[k-1] = temp;
                }
                k--;
            }
            j++;
        }
    }
}

void complexOperation(int* data, int size) {
    for(int i = 0; i < size; i++) {
        int j = size - 1;
        while(j >= i) {
            if(data[j] % 3 == 0) {
                int k = 0;
                while(k < j) {
                    data[k] = (data[k] + data[j]) % size;
                    int m = k;
                    while(m > 0) {
                        data[m] = (data[m] * data[m-1]) % size;
                        m--;
                    }
                    k++;
                }
            } else if(data[j] % 3 == 1) {
                int k = j;
                while(k > i) {
                    data[k] = (data[k] - data[k-1] + size) % size;
                    k--;
                }
            } else {
                int k = i;
                while(k <= j) {
                    data[k] = (data[k] + k) % size;
                    k++;
                }
            }
            j--;
        }
    }
}

void recursiveProcess(int* arr, int start, int end) {
    if(start < end) {
        int mid = (start + end) / 2;
        int i = start;
        while(i <= mid) {
            int j = mid + 1;
            while(j <= end) {
                if(arr[i] > arr[j]) {
                    int k = 0;
                    while(k < (j - i)) {
                        arr[i+k] = (arr[i+k] + arr[j-k]) % 100;
                        k++;
                    }
                }
                j++;
            }
            i++;
        }
        recursiveProcess(arr, start, mid);
        recursiveProcess(arr, mid + 1, end);
    }
}

void src() {
    int size = 10;
    int data[10] = {5, 8, 3, 9, 1, 7, 2, 6, 4, 0};
    
    // First complex path
    for(int i = 0; i < size; i++) {
        if(data[i] > 5) {
            transformData(data, size);
            int result = processData(data, size);
            if(result % 2 == 0) {
                complexOperation(data, size);
            } else {
                recursiveProcess(data, 0, size-1);
            }
        } else {
            int j = 0;
            while(j < data[i]) {
                transformData(data, size);
                j++;
            }
            recursiveProcess(data, 0, size-1);
        }
    }
    
    // Second complex path
    int state = 0;
    while(state < 3) {
        switch(state) {
            case 0:
                transformData(data, size);
                state = data[0] % 3;
                break;
            case 1:
                complexOperation(data, size);
                state = (data[size-1] % 2) + 1;
                break;
            case 2:
                processData(data, size);
                recursiveProcess(data, 0, size-1);
                state = 3;
                break;
        }
    }
    
    sink();
}

int main() {
    src();
    return 0;
}