CC=gcc
CFLAGS=-g -I. #-O2
ASFLAGS=-g
ASFLAGS+=-DNOP_REPEAT=6

EXE=test

OBJS=test.o jump.o nopshort.o noplong.o

all: $(EXE)
	./$(EXE)

$(EXE): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f $(OBJS) $(EXE)
