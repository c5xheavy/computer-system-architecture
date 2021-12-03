#include "sphere.h"

void In(sphere& s, std::ifstream& ifst) {
	ifst >> s.r;
}

void InRnd(sphere& s) {
	s.r = Random();
}

void Out(sphere& s, ofstream& ofst) {
	ofst << "It is Sphere: "
		<< "r = " << s.r
		<< ". Volume = " << Volume(s) << '\n';
}

double Volume(sphere& s) {
	return  pi * s.r * s.r * s.r * 4 / 3;
}
