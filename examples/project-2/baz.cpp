#include <iostream>
#include "baz.h"

using namespace std;

void foo() {
	cout << "Doing awesome stuff" << endl;
}

void bar(int& i) {
	cout << "Current value of variable i is " << i << endl;
}
