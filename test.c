#include <stdio.h>
#include <x86intrin.h>

extern int foo (int);
extern int foo_no_table (int);

int global = 20;

#define LOOP 30000

int
main ()
{
  int i;
  unsigned long long start, end;
  unsigned long long diff1, diff2;

  start = __rdtscp (&i);
  for (i = 0; i < LOOP; i++)
    foo_no_table (i);
  end = __rdtscp (&i);
  diff1 = end - start;

  printf ("no jump table: %lld\n", diff1);

  start = __rdtscp (&i);
  for (i = 0; i < LOOP; i++)
    foo (i);
  end = __rdtscp (&i);
  diff2 = end - start;

  printf ("jump table   : %lld (%.2f%%)\n",
	  diff2, 100.0f * diff2 / diff1);

  return 0;
}
