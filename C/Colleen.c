#include <stdio.h>

#define NEWLINE 10
#define TAB 9
#define QUOTE 34

/*
  Comment Outside main function
*/

char *getCode(void)
{
	char *code = "#include <stdio.h>%1$c%1$c#define NEWLINE 10%1$c#define TAB 9%1$c#define QUOTE 34%1$c%1$c/*%1$c  Comment Outside main function%1$c*/%1$c%1$cchar *getCode(void)%1$c{%1$c%2$cchar *code = %3$c%4$s%3$c;%1$c%2$creturn code;%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$cchar *code_from_func = getCode();%1$c%2$c/*%1$c%2$c  Comment Inside main function%1$c%2$c*/%1$c%2$c%1$c%2$cprintf(code_from_func, NEWLINE, TAB, QUOTE, code_from_func);%1$c%2$creturn 0;%1$c}%1$c";
	return code;
}

int main(void)
{
	char *code_from_func = getCode();
	/*
	  Comment Inside main function
	*/
	
	printf(code_from_func, NEWLINE, TAB, QUOTE, code_from_func);
	return 0;
}
