#ifndef __parallelepiped__
#define __parallelepiped__

#include <fstream>
using namespace std;

#include "rnd.h"

struct parallelepiped {
	int a, b, c; 
};

void In(parallelepiped& t, ifstream& ifst);

void InRnd(parallelepiped& t);

void Out(parallelepiped& t, ofstream& ofst);

double Volume(parallelepiped& t);

#endif 
