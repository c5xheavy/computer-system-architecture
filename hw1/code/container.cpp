#include "container.h"

void Init(container& c) {
	c.len = 0;
}

void Clear(container& c) {
	for (int i = 0; i < c.len; i++) {
		delete c.cont[i];
	}
	c.len = 0;
}

void In(container& c, ifstream& ifst) {
	while (!ifst.eof()) {
		if ((c.cont[c.len] = In(ifst)) != 0) {
			c.len++;
		}
	}
}

void InRnd(container& c, int size) {
	while (c.len < size) {
		if ((c.cont[c.len] = InRnd()) != nullptr) {
			c.len++;
		}
	}
}

void Out(container& c, ofstream& ofst) {
	ofst << "Container contains " << c.len << " elements." << endl;
	for (int i = 0; i < c.len; i++) {
		ofst << i << ": ";
		Out(*(c.cont[i]), ofst);
	}
}

void sort(container& c) {
	for (int i = 1; i < c.len; i++) {
		int j = i;
		while (j > 0 && Volume(*c.cont[j - 1]) > Volume(*c.cont[j])) {
			swap(c.cont[j - 1], c.cont[j]);
			j--;
		}
	}
}
