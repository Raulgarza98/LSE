#include<stdio.h>
#include <string.h>
int main(int argc, char *argv[])
{
int l, w;
l = atoi(argv[3]);
w = atoi(argv[5]);	
if (!strcmp(argv[1], "-a")) {
int area = l*w;
printf("area = %d units\n", area);
}
else if (!strcmp(argv[1], "-p")){
int per = l+l+w+w;
printf("perimeter = %d units\n", per);	
}
else {
printf("Argumentos invalidos\n");
}
return 0;
}
