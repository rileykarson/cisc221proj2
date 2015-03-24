//file:f5.c
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>

int a[200][200];
int b[200];
int c[200][200];

void arrgen(int *arr,int asize){
   int i;
	
   for (i=0;i<asize;i++){
      arr[i] = rand() % 8192;
   }
}


int ipow(int base, int exp)
{
    int result = 1;
    while (exp)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        base *= base;
    }

    return result;
}     

void f5(int *b,int size,int mf){
  int x;
  x = 0;
  while (x <= size/3){
    b[x] = b[x] + ipow(mf,3);
    x++;
  }
}

void main(){
 srand(time(NULL));
 arrgen(&b[0],200);
 int x;
 for (x=1;x<1000000;x++){
   f5(&b[0],120,4);
 }
}
