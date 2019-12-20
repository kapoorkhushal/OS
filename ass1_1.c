#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<stdlib.h>
int main(int argc , char *argv[])
{
	if(3 != argc)
	{
		printf("Wrong no. of arguments\n");
		exit(0);
	}
	FILE *source,*destination;
	if(NULL == (source=fopen(argv[1],"r")))
	{
		printf("Error in opening file1\n");
		exit(0);
	}
	if(NULL == (destination=fopen(argv[2],"w")))
	{
		printf("Error	 in opening file2\n");
		exit(0);
	}
	pid_t pid;
	int fd[2] , i=0;
	if(-1 == pipe(fd))
	{
		printf("Error in pipe creation\n");
	}
	pid = fork();
	if(pid<0)
	{
		printf("fork fail\n");
	}
	if(pid>0)
	{
		char c, ch;	
		while((ch = fgetc(source)) != EOF)
		{
			fputc(ch, destination);
		}
		fclose(source);
		fclose(destination);
		printf("Content of file (%s) is \n",argv[2]);
		if(NULL == (destination=fopen(argv[2],"r")))
		{
			printf("Error in opening file2\n");
			exit(0);
		}
		c=getc(destination);
		while(c != EOF)
		{
			putchar(c);
			c=getc(destination);
		}
		fclose(destination);
	}
	return 0;
}

