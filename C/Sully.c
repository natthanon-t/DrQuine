#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	char *code = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$cint main()%1$c{%1$c%2$cchar *code = %3$c%4$s%3$c;%1$c%2$cchar fileName[100];%1$c%2$cchar execCmd[100];%1$c%2$cchar currentFile[100];%1$c%2$cint i = %5$d;%1$c%1$c%2$cif (i <= 0) return 0;%1$c%2$csprintf(currentFile, %3$cSully_%%d.c%3$c, i);%1$c%2$cif (!strcmp(__FILE__, currentFile)) i--;%1$c%2$csprintf(fileName, %3$cSully_%%d.c%3$c, i);%1$c%2$cFILE *f = fopen(fileName, %3$cw%3$c);%1$c%2$cif (f == NULL) return 1;%1$c%2$cfprintf(f, code, 10, 9, 34, code, i);%1$c%2$cfclose(f);%1$c%2$csprintf(execCmd, %3$cclang -o Sully_%%d Sully_%%d.c%3$c, i, i);%1$c%2$csystem(execCmd);%1$c%2$cchar runCmd[100];%1$c%2$csprintf(runCmd, %3$c./Sully_%%d%3$c, i);%1$c%2$csystem(runCmd);%1$c%2$creturn 0;%1$c}%1$c";
	char fileName[100];
	char execCmd[100];
	char currentFile[100];
	int i = 5;

	if (i <= 0) return 0;
	sprintf(currentFile, "Sully_%d.c", i);
	if (!strcmp(__FILE__, currentFile)) i--;
	sprintf(fileName, "Sully_%d.c", i);
	FILE *f = fopen(fileName, "w");
	if (f == NULL) return 1;
	fprintf(f, code, 10, 9, 34, code, i);
	fclose(f);
	sprintf(execCmd, "clang -o Sully_%d Sully_%d.c", i, i);
	system(execCmd);
	char runCmd[100];
	sprintf(runCmd, "./Sully_%d", i);
	system(runCmd);
	return 0;
}
