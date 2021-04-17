#include <stdio.h>
#include <stdlib.h>

void resi(int n, int m){
    if(n == m){
        printf("jednaki su \n");
        exit(EXIT_SUCCESS);
    }
    if(n > m){
        printf("%d je veci od %d\n", n, m);
        exit(EXIT_SUCCESS);
    }
    else{
        printf("%d je veci od %d\n", m, n);
        exit(EXIT_SUCCESS);
    }

}
int main(int argc, char** argv){
    int n, m;
    printf("Unesite 2 broja\n");


    



    return 0;
}