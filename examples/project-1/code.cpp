#include <iostream>

using namespace std;

void foo();
void bar(int& i);

int main() {
	foo();

	int i = 1;
	bar(i);

	return 0;
}

void foo() {
	cout << "Doing awesome stuff" << endl;
}

void bar(int& i) {
	cout << "Current value of variable i is " << i << endl;
}
