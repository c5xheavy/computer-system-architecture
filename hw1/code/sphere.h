#ifndef __sphere__
#define __sphere__

#include <fstream>
using namespace std;

#include "rnd.h"

const long double pi = 3.141592653;

struct sphere {
	int r; 
};

void In(sphere& s, ifstream& ifst);

void InRnd(sphere& s);

void Out(sphere& s, ofstream& ofst);

double Volume(sphere& s);

#endif 
