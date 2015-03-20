#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<string.h>

int a[200][200];
int b[200];
int c[200][200];
int d[200];
char ch[] = "AbCdEfG1234HijklM\n\0";

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

void f1(int *a, int *b,int rnum,int cols){
   int j;
     for (j = 0; j < cols;j++)
	a[rnum*cols +j] = b[j];  
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

void f3(int *a, int *b,int rows,int cols){
   int i,j;
   for (i=0;i<rows;i++){
     for (j = 0; j < cols;j++)
	a[i*cols +j] = b[i];  
          
   }
}

void f4(char *ch){
  int i;
  for (i=0;i < strlen(ch);i++){
    if (ch[i] >= 'A' && ch[i] <= 'Z')
        ch[i] -= ('A' - 'a');
  }
}

void f5(int *b,int size,int mf){
  int x;
  x = 0;
  while (x <= size/3){
    b[x] = b[x] + ipow(mf,3);
    x++;
  }
}

void f6(int *b,int asize, int *d){
  int i;
  d[0] = b[0];
  for (i = 1;i< asize;i++){
         d[i] = b[i] + b[i-1];
     }
}

void main(){
 srand(time(NULL));
 arrgen(&b[0],200);
 arrgen2d(&a[0][0],200,200);
 int i;
 for (i = 1;i < 1000000;i++){
   f1(&a[0][0],&b[0],100,200);
 }

 for (i = 1;i < 1000;i++){
   f2(&a[0][0],&c[0][0],200,200);
 }

 for (i = 1;i < 5000;i++){
   f3(&a[0][0],&b[0],200,200);
 }

 for (i = 1;i < 5000000;i++){
   f4(ch);
 }

 for (i=1;i<1000000;i++){
   f5(&b[0],120,4);
 }

 for (i=1;i<500000;i++){
  f6(&b[0],200,&d[0]);
 }

}

