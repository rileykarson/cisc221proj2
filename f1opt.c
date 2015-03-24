//file:f1.c
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int a[200][200];
int b[200];

void arrgen(int *arr,int asize){
   int i;
	
   for (i=0;i<asize;i++){
	  arr[i] = rand() % 8192;
   }
}

void arrgen2d(int *a,int rows,int cols){
  int i,j;
  for (i = 0;i<rows;i++){
	 for (j=0;j<cols;j++){
		 a[i*cols+j] = rand() % 8192;
	 }
  }
}
	 
void f1(int *a, int *b,int rnum,int cols){
	int j;
	int rnumj = rnum*cols;
	for (j = cols-1; j >= 0; j--) {
		a[rnumj + j] = b[j];
	}
}
void main(){
 srand(time(NULL));
 arrgen(&b[0],200);
 arrgen2d(&a[0][0],200,200);
 int i;
 for (i=1;i<1000000;i++)
 f1(&a[0][0],&b[0],100,200);
}
