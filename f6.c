//file: f6.c
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int a[200][200];
int b[200];
int d[200];

void arrgen(int *arr,int asize){
   int i;
	
   for (i=0;i<asize;i++){
      arr[i] = rand() % 8192;
   }
}
     

void f6(int *b,int asize, int *c){
  int i;
  d[0] = b[0];
  for (i = 1;i< asize;i++){
         d[i] = b[i] + b[i-1];
     }
}
void  main(){
 srand(time(NULL));
 arrgen(&b[0],200);
 int i;
 for (i=1;i<500000;i++)
 f6(&b[0],200,&d[0]);
}


