#include<stdio.h>
#include<stdlib.h>
#include <string.h>
int main(int argc, char *argv[])
{
	FILE* f = fopen("Datalog.txt", "w");
	if (f == NULL)
	{
		fprintf(stderr, "Error opening file! \n");	
		exit(1);
	}
	int lim = atoi(argv[2]);
	int i = 0;
	char name[30], id[30], res[30];
	while (i < lim)
	{
		printf("Enter Name:\n[give name][ENTER]");
		scanf("%s",name);
		fprintf(f, "Name: %s ", name);
		printf("Enter Id:\n[give id][ENTER]");
		scanf("%s",id);
		fprintf(f, "ID: %s \n", id);
		i++;
	}
	fclose(f);
}
