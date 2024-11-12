//********************************************************************
//
// Operating Systems
// Programming Project #5: Paging Simulation
// Due, Thu Dec 6, 2005
// Instructor: Michael C. Scherger
//
//********************************************************************

#ifndef LRU_H
#define LRU_H
int lru();
#endif
#ifndef MAIN_CPP
#include <list>
using namespace std;
extern list<int> references;
extern int buffersize;
#endif

