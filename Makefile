CC=gcc
CFLAGS=-g -I.
CFLAGS+=-O2
ASFLAGS=-g

EXE=test

OBJS=test.o compare.o compare-nop.o

all: $(EXE)
	./$(EXE)

$(EXE): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f $(OBJS) $(EXE)
