# SIMPAGER Makefile
# if target file is out of date, compile it
# once it's up to date, it does the second task!

# use make -n to debug... will TELL you what it's going to do, yet not actually do it

# CXX: MACRO FOR THE DEFAULT NAME FOR THE C++ COMPLIER
CXX = g++

# option for the compiler
CXXFLAGS = -O2

# all object files to reference
OBJS = main.o fifo.o lru.o opt.o rand.o

# $^ - means "all the dependencies", it points up at the dependencies
# $< - means "the first dependency"
# $@ - means "the target name"

# here, $@ could be replaced by simpager, $(OBJS) can be replaced with all the .o file names
simpager: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# general rule for all compile objects
#targets... : target_pattern : prereq_pattern
#	commands

# "any .o, .c file in your dependency list"
# if you type make clean first, the cmd will search for a "clean.o" target...
$(OBJS) : %.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $<


#main.o: main.cpp # you can replace $< with the main.cpp
#	$(CXX) $(CXXFLAGS) -c $<
# -c means compile only

#fifo.o: fifo.cpp
#	$(CXX) $(CXXFLAGS) -c $<

#lru.o: lru.cpp
#	$(CXX) $(CXXFLAGS) -c $<

#opt.o: opt.cpp
#	$(CXX) $(CXXFLAGS) -c $<

#rand.o: rand.cpp
#	$(CXX) $(CXXFLAGS) -c $<

# (make clean) use the full path of the rm cmd instead of aliases... will remove the .o files (-f forces the rm)
# .PHONY will make this target command an exception to the previous $(OBJS) command line
.PHONY: clean
clean:
	/bin/rm -f *.o simpager
