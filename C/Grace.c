#include <stdio.h>

#define FILENAME "Grace_kid.c"
#define CODE "#include <stdio.h>%c%c#define FILENAME %c%s%c%c#define CODE %c%s%c%c#define FT()int main() { FILE *f = fopen(FILENAME, %cw%c); if (f != NULL) { fprintf(f,CODE,10,10,34,FILENAME,34,10,34,CODE,34,10,34,34,10,10,10,10,10,9,10,10); fclose(f); } return 0; }%c%cFT()%c%c/*%c%cOne comment%c*/%c"
#define FT()int main() { FILE *f = fopen(FILENAME, "w"); if (f != NULL) { fprintf(f,CODE,10,10,34,FILENAME,34,10,34,CODE,34,10,34,34,10,10,10,10,10,9,10,10); fclose(f); } return 0; }

FT()

/*
	One comment
*/
