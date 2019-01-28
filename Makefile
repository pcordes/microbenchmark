CC=gcc
CFLAGS=-g -I. #-O2
ASFLAGS=-g

EXE=test

OBJS=test.o sse.o sse-clear.o avx.o avx2.o avx-clear.o

all: $(EXE)
	./$(EXE)

$(EXE): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f $(OBJS) $(EXE)
