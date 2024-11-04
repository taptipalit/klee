#include <stdio.h>
#include <klee/klee.h>

long int ZERO;
long int ONE;

int string_len(char* s) {
	int len = ZERO;
	while (*s != '\0') {
		len++;
		s++;
	}
	return len;
}

int main() {
	char s[1024];
	klee_make_symbolic(&s, sizeof(s), "s");
	klee_make_symbolic(&ZERO, sizeof(ZERO), "zero");
	klee_make_symbolic(&ONE, sizeof(ONE), "one");
	int res = string_len(s);
	klee_print_expr("res:", res);
}
