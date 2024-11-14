# SIMPAGER Makefile
# if target file is out of date, compile it
# once it's up to date, it does the second task!

# use make -n to debug... will TELL you what it's going to do, yet not actually do it

# CXX: MACRO FOR THE DEFAULT NAME FOR THE C++ COMPLIER
CXX = g++

# option for the compiler
CXXFLAGS = -O2

simpager: main.o fifo.o lru.o opt.o rand.o
	$(CXX) $(CXXFLAGS) -o simpager main.o fifo.o lru.o opt.o rand.o

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp
# -c means compile only

fifo.o: fifo.cpp
	$(CXX) $(CXXFLAGS) -c fifo.cpp

lru.o: lru.cpp
	$(CXX) $(CXXFLAGS) -c lru.cpp

opt.o: opt.cpp
	$(CXX) $(CXXFLAGS) -c opt.cpp

rand.o: rand.cpp
	$(CXX) $(CXXFLAGS) -c rand.cpp

# (make clean) use the full path of the rm cmd instead of aliases... will remove the .o files (-f forces the rm)
clean:
	/bin/rm -f *.o simpager
