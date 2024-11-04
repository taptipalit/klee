#include <stdio.h>
#include <klee/klee.h>

long int ZERO;
long int ONE;

unsigned long long factorial_iterative(int n) {
	unsigned long long result = ONE;
	for (unsigned long long i = ONE; i <= n; i++) {
		result *= i;
	}
	return result;
}

int main() {
	int num;
	klee_make_symbolic(&num, sizeof(num), "num");
	klee_make_symbolic(&ZERO, sizeof(ZERO), "zero");
	klee_make_symbolic(&ONE, sizeof(ONE), "one");
	int res = factorial_iterative(num);
	klee_print_expr("res:", res);
}
