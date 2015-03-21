//file: f4.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char ch[] = "AbCdEfG1234HijklM\n\0";
void f4(char *ch){
  int i,length;
  length = strlen(ch);
  char character;
  int diff = 'A' - 'a';
  for (i=0;i < length;i++){
	character = ch[i];
    if (character >= 'A' && character <= 'Z')
        character -= diff;
  }
}
void main(){
 int i;
 for (i=1;i<5000000;i++){
   f4(ch);
 }
}