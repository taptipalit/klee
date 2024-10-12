#include <stdio.h>
#include <klee/klee.h>


struct Student {
	int id;
	int age;
	char* name;
};


void function(struct Student* s, int* b) {
	int a = s->age;
	s->id = a + 20;
	*b = 300;
	/*
	if (s->id > 10) {
		if (s->age < 20) {
			printf("Welcome %s!!!\n", s->name);
		} else {
			printf("Welcome %s!!\n", s->name);
		}
	}
	*/
}


int main(void) {
	// Fix this now
	struct Student s;
	/*
	int* p, *q;
	p = &(s.id);
	q = &(s.age);
	*/
	s.name = malloc(100);
	/*
	klee_make_symbolic(p, sizeof(int), "id");
	klee_make_symbolic(q, sizeof(int), "age");
	*/
	klee_make_symbolic(&s, sizeof(s), "student");

	klee_make_symbolic(s.name, 100, "name");
	int b;
	klee_make_symbolic(&b, sizeof(b), "b");

	function(&s, &b);
	klee_print_expr("Symbolic value of s.id:", (s.id));
	klee_print_expr("Symbolic value of s.age: ", (s.age));

	klee_print_expr("Symbolic value of b: ", b);
}
