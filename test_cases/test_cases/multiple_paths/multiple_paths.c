int x;

void init(){ x = 3; }

void sink(){

}

void src(){
    if(x != 3){
        init();
    }
    sink();
}

int main(){
    x = 0;
    src();
}