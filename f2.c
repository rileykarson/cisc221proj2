//file:f2.c
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int a[200][200];
int c[200][200];

void arrgen2d(int *a,int rows,int cols){
  int i,j;
  for (i = 0;i<rows;i++){
     for (j=0;j<cols;j++){
         a[i*cols+j] = rand() % 8192;
     }
  }
}
     
void f2(int *a,int *c,int rows,int cols){
   int i,j;
   int up,down,left,right,avg;
   for (i=1;i<rows-1;i++){
     for (j = 1; j < cols-1;j++){
      up =    a[(i-1)*cols + j  ];
	down =  a[(i+1)*cols + j  ];
	left =  a[i*cols     + j-1];
	right = a[i*cols     + j+1];
	avg = (up + down + left + right)/4;
	c[i*cols +j] = avg;  
     }
   }
}
void main(){
 srand(time(NULL));
 arrgen2d(&a[0][0],200,200);
 int x;
 for (x=1;x<1000;x++){
  f2(&a[0][0],&c[0][0],200,200);
 }
}
