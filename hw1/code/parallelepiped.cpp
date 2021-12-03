#include "parallelepiped.h"

void In(parallelepiped& t, ifstream& ifst) {
	ifst >> t.a >> t.b >> t.c;
}

void InRnd(parallelepiped& t) {
	t.a = Random();
	t.b = Random();
	t.c = Random();
}

void Out(parallelepiped& t, ofstream& ofst) {
	ofst << "It is Parallelepiped: "
		<< "a = " << t.a
		<< ", b = " << t.b
		<< ", c = " << t.c
		<< ". Volume = " << Volume(t) << '\n';
}

double Volume(parallelepiped& t) {
	return t.a * t.b * t.c * 1.0;
}
