//********************************************************************
//
//********************************************************************
#include <iostream>
#include <list>
#include <cstring>
#include <cstdlib>
#include "lru.h"
#include "rand.h"
#include "opt.h"
#include "fifo.h"

using namespace std;

list<int> references;  // reference string
int buffersize; // number of frames


//********************************************************************
//
// main function
//
//********************************************************************
int main()
{
  int tmp,count=0;
  list<int>::iterator i;
  char algo[16];
  srand(time(0));
  while(cin.peek()!='\n') { cin>>tmp; references.push_back(tmp); }
  cin.ignore(1); cin>>buffersize;
  while(cin.peek()=='\n') cin.ignore(1);
  cout<<"Page reference string:";
  for(i=references.begin();i!=references.end();i++) {
    if(!(count++%20)) cout<<endl; cout<<*i<<" ";
  }
  cout<<"\nNumber of frames: "<<buffersize<<endl;
    while(!cin.eof()) {
      cin.getline(algo,16); tmp=0;
      if(!strcmp("FIFO",algo)) tmp=fifo();
      if(!strcmp("RAND",algo)) tmp=rand_page();
      if(!strcmp("OPT",algo)) tmp=opt();
      if(!strcmp("LRU",algo)) tmp=lru();
      if(tmp)cout<<algo<<": "<<tmp<<endl;
    while(cin.peek()=='\n'||
        cin.peek()=='\r'||//ignore the trailing end of lines
        cin.peek()=='\0') cin.ignore(1);
    }
  return 0;
}
