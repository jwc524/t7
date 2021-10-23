include ../resources/makefile

$(PROJ)m.cpp: ../t0/t0m.cpp
	sed 's/fib/Fib/g' < ../t0/t0m.cpp > $@

clean::
	rm $(PROJ)m.cpp
