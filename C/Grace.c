#include <stdio.h>

#define FILENAME "Grace_kid.c"
#define CODE "#include <stdio.h>%c%c#define FILENAME %c%s%c%c#define CODE %c%s%c%c#define FT()int main(void) { FILE *f = fopen(FILENAME, %cw%c); if (f == NULL) return 1; if (fprintf(f, CODE, 10, 10, 34, FILENAME, 34, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10) < 0) { fclose(f); return 1; } if (fclose(f) == EOF) return 1; return 0; }%c%cFT()%c%c/*%c  One comment%c*/%c"
#define FT()int main(void) { FILE *f = fopen(FILENAME, "w"); if (f == NULL) return 1; if (fprintf(f, CODE, 10, 10, 34, FILENAME, 34, 10, 34, CODE, 34, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10) < 0) { fclose(f); return 1; } if (fclose(f) == EOF) return 1; return 0; }

FT()

/*
  One comment
*/
