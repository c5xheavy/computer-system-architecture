#ifndef __container__
#define __container__

#include "shape.h"

struct container {
	enum { max_len = 10010 }; 
	int len; 
	shape* cont[max_len];
};

void Init(container& c);

void Clear(container& c);

void In(container& c, ifstream& ifst);

void InRnd(container& c, int size);

void Out(container& c, ofstream& ofst);

void sort(container& c);

#endif
