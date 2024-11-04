#include <stdio.h>
#include <klee/klee.h>

void function(char* input, int shift) {
	input[0] = 'A';
	input[1] = 'B';
}

int main() {
	char array[1024];
	klee_make_symbolic(array, sizeof(array), "array");
	function(array, 4);
	klee_print_expr("array:", (char)(array[0]));
}
