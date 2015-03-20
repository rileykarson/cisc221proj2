//file: f4.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char ch[] = "AbCdEfG1234HijklM\n\0";
void f4(char *ch){
  int i;
  for (i=0;i < strlen(ch);i++){
    if (ch[i] >= 'A' && ch[i] <= 'Z')
        ch[i] -= ('A' - 'a');
  }
}
void main(){
 int i;
 for (i=1;i<5000000;i++){
   f4(ch);
 }
}
