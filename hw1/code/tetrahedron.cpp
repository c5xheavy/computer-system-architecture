#include "tetrahedron.h"

void In(tetrahedron& t, ifstream& ifst) {
	ifst >> t.a;
}

void InRnd(tetrahedron& t) {
	t.a = Random();
}

void Out(tetrahedron& t, ofstream& ofst) {
	ofst << "It is Tetrahedron: "
		<< "a = " << t.a
		<< ". Volume = " << Volume(t) << '\n';
}

double Volume(tetrahedron& t) {
	return t.a * t.a * t.a * sqrt2 / 12;
}
