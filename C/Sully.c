#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	char *code = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$cint main(void)%1$c{%1$c%2$cchar *code = %3$c%4$s%3$c;%1$c%2$cchar fileName[100];%1$c%2$cchar execCmd[100];%1$c%2$cchar currentFile[100];%1$c%2$cint i = %5$d;%1$c%2$cint ret;%1$c%1$c%2$cif (i <= 0) return 0;%1$c%2$cret = snprintf(currentFile, sizeof(currentFile), %3$cSully_%%d.c%3$c, i);%1$c%2$cif (ret < 0 || ret >= (int)sizeof(currentFile)) return 1;%1$c%2$cif (!strcmp(__FILE__, currentFile)) i--;%1$c%2$cret = snprintf(fileName, sizeof(fileName), %3$cSully_%%d.c%3$c, i);%1$c%2$cif (ret < 0 || ret >= (int)sizeof(fileName)) return 1;%1$c%2$cFILE *f = fopen(fileName, %3$cw%3$c);%1$c%2$cif (f == NULL) return 1;%1$c%2$cif (fprintf(f, code, 10, 9, 34, code, i) < 0) {%1$c%2$c%2$cfclose(f);%1$c%2$c%2$creturn 1;%1$c%2$c}%1$c%2$cif (fclose(f) == EOF) return 1;%1$c%2$cret = snprintf(execCmd, sizeof(execCmd), %3$cclang -o Sully_%%d Sully_%%d.c%3$c, i, i);%1$c%2$cif (ret < 0 || ret >= (int)sizeof(execCmd)) return 1;%1$c%2$cif (system(execCmd) != 0) return 1;%1$c%2$cchar runCmd[100];%1$c%2$cret = snprintf(runCmd, sizeof(runCmd), %3$c./Sully_%%d%3$c, i);%1$c%2$cif (ret < 0 || ret >= (int)sizeof(runCmd)) return 1;%1$c%2$cif (system(runCmd) != 0) return 1;%1$c%2$creturn 0;%1$c}%1$c";
	char fileName[100];
	char execCmd[100];
	char currentFile[100];
	int i = 5;
	int ret;

	if (i <= 0) return 0;
	ret = snprintf(currentFile, sizeof(currentFile), "Sully_%d.c", i);
	if (ret < 0 || ret >= (int)sizeof(currentFile)) return 1;
	if (!strcmp(__FILE__, currentFile)) i--;
	ret = snprintf(fileName, sizeof(fileName), "Sully_%d.c", i);
	if (ret < 0 || ret >= (int)sizeof(fileName)) return 1;
	FILE *f = fopen(fileName, "w");
	if (f == NULL) return 1;
	if (fprintf(f, code, 10, 9, 34, code, i) < 0) {
		fclose(f);
		return 1;
	}
	if (fclose(f) == EOF) return 1;
	ret = snprintf(execCmd, sizeof(execCmd), "clang -o Sully_%d Sully_%d.c", i, i);
	if (ret < 0 || ret >= (int)sizeof(execCmd)) return 1;
	if (system(execCmd) != 0) return 1;
	char runCmd[100];
	ret = snprintf(runCmd, sizeof(runCmd), "./Sully_%d", i);
	if (ret < 0 || ret >= (int)sizeof(runCmd)) return 1;
	if (system(runCmd) != 0) return 1;
	return 0;
}
