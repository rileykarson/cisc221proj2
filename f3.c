//file:f3.c
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int a[200][200];
int b[200];

void arrgen(int *arr,int asize){
   int i;
	
   for (i=0;i<asize;i++){
      arr[i] = rand() % 8192;
//	arr[i] = 0;
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
     
void f3(int *a, int *b,int rows,int cols){
   int i,j;
   for (i=0;i<rows;i++){
     for (j = 0; j < cols;j++)
	a[i*cols +j] = b[i];  
          
   }
}
void main(){
 srand(time(NULL));
 arrgen(&b[0],200);
 arrgen2d(&a[0][0],200,200);
 int i;
 for (i=1;i<5000;i++)
 f3(&a[0][0],&b[0],200,200);
}
