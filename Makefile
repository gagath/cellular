EXEC = cellular
MAIN = main.ali

OBJS = main.o cellular.o

.PHONY: clean mrproper

all: $(EXEC)

$(EXEC): $(OBJS)
	gnatbind $(MAIN)
	gnatlink $(MAIN) -o $(EXEC)

%.o: %.adb
	gcc -c $<

clean:
	rm -Rf *.ali
	rm -Rf *.o

mrproper: clean
	rm -Rf $(EXEC)
