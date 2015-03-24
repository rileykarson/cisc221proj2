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
	int avg;
	int pre, prej;
	int r = rows - 2;
	int co = cols - 2;
	for (i = r; i > 0; i--){
		pre = i*cols;
		prej = pre + co;
		for (j = co; j > 0; j--){
			prej--;
			avg = a[prej - cols];
			avg += a[prej + cols];
			avg += a[prej + (-1)];
			avg += a[prej + (+1)];
			c[prej] = avg >> 2;  
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