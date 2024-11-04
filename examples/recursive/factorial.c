#include <stdio.h>
#include <klee/klee.h>


/*
long int ZERO;
long int ONE;
*/


int function(int n) {
	if (n <= 1) { // Base case: factorial of 0 or 1 is 1
		return 1;
	} else {
		return n * function(n - 1); // Recursive case
	}
}

/*
void function(char* input, int shift) {
	for (int i = 0; i < 5;i++) {
		input[i] = 'h';
	}
}
*/

int main() {
	int num;
	klee_make_symbolic(&num, sizeof(num), "num");
/*
	klee_make_symbolic(&ZERO, sizeof(ZERO), "zero");
	klee_make_symbolic(&ONE, sizeof(ONE), "one");
*/
	int res = function(num);
	klee_print_expr("res:", res);
}
