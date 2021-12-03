#ifndef __shape__
#define __shape__

#include "sphere.h"
#include "parallelepiped.h"
#include "tetrahedron.h"

struct shape {
	enum key { SPHERE, PARALLELEPIPED, TETRAHEDRON };
	key k; 
	union { 
		sphere s;
		parallelepiped p;
		tetrahedron t;
	};
};

shape* In(ifstream& ifdt);

shape* InRnd();

void Out(shape& s, ofstream& ofst);

double Volume(shape& s);

#endif
