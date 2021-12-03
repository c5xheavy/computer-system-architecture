#ifndef __tetrahedron__
#define __tetrahedron__

#include <fstream>
using namespace std;

#include "rnd.h"
#include "constants.h"

struct tetrahedron {
	int a; 
};

void In(tetrahedron& t, ifstream& ifst);

void InRnd(tetrahedron& t);

void Out(tetrahedron& t, ofstream& ofst);

double Volume(tetrahedron& t);

#endif 
