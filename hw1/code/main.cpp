#include <iostream>
#include <fstream>
#include <cstdlib> 
#include <ctime>   
#include <cstring>

#include "container.h"

void errMessage1() {
	cout << "incorrect command line!\n"
		"  Waited:\n"
		"     command -f infile outfile01 outfile02\n"
		"  Or:\n"
		"     command -n number outfile01 outfile02\n";
}

void errMessage2() {
	cout << "incorrect qualifier value!\n"
		"  Waited:\n"
		"     command -f infile outfile01 outfile02\n"
		"  Or:\n"
		"     command -n number outfile01 outfile02\n";
}

//------------------------------------------------------------------------------
int main(int argc, char* argv[]) {
	if (argc != 5) {
		errMessage1();
		return 1;
	}

	cout << "Start" << endl;
	container c;
	Init(c);

	if (!strcmp(argv[1], "-f")) {
		ifstream ifst(argv[2]);
		In(c, ifst);
	}
	else if (!strcmp(argv[1], "-n")) {
		auto size = atoi(argv[2]);
		if ((size < 1) || (size > 10000)) {
			cout << "incorrect numer of figures = "
				<< size
				<< ". Set 0 < number <= 10000\n";
			return 3;
		}
		srand(static_cast<unsigned int>(time(0)));
		InRnd(c, size);
	}
	else {
		errMessage2();
		return 2;
	}

	ofstream ofst1(argv[3]);
	ofst1 << "Filled container:\n";
	Out(c, ofst1);

	sort(c);
	ofstream ofst2(argv[4]);
	ofst2 << "Sorted container:\n";
	Out(c, ofst2);

	Clear(c);
	cout << "Stop" << endl;
	return 0;
}
