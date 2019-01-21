CC=gcc
CFLAGS=-g -I.
CFLAGS+=-O2
ASFLAGS=-g

EXE=test

OBJS=test.o libgcc2.o soft-fp.o floattixf-libgcc2.o floattixf-soft-fp.o

all: $(EXE)
	./$(EXE)

$(EXE): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f $(OBJS) $(EXE)
