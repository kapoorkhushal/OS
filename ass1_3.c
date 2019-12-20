#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<fcntl.h>
#include<unistd.h>
#define BUFFER_SIZE 9999
int main(int argc , char *argv[])
{
	if(argc<2)
	{
		printf("Wrong no. of arguments\n\n");
		exit(0);
	}
	int fd[argc-1], i=0, j=0;
	char buffer[BUFFER_SIZE];
	ssize_t in,out;
	if(argc==2)
	{
		fd[argc-1]=open(argv[argc-1],O_RDONLY);
		in = read(fd[argc-1],&buffer,BUFFER_SIZE);
		printf("%s\n",buffer);
		exit(0);	
	}
	for(i=1;i<=argc-2;i++)
	{
		fd[i-1]=open(argv[i],O_RDONLY);
		if(-1==fd[i-1])
		{
			printf("Error in opening file '%s'\n",argv[i]);
			exit(0);
		}
	}
	fd[argc-2]=open(argv[i],O_WRONLY);
	for(i=argc-3;i>=0;i--)
	{
		in = read(fd[i],&buffer,BUFFER_SIZE);
		out = write(fd[argc-2],&buffer,(ssize_t)in);
	}
	printf("Content Copied Successfully to the file (%s) \n",argv[4]);
	return 0;
}
