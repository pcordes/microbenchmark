#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

extern int foo (int);
extern int foo_no_table (int);

int global;

#define LOOP 30000

int
main (int argc, char **argv)
{
  int i, loop, total;
  unsigned long long start, end;
  unsigned long long diff1, diff2;

  loop = 0;
  if (argc > 1)
    loop = atoi (argv[1]);
  if (loop <= 0)
    loop = LOOP;

  printf ("%d loops:\n", loop);

  global = 20;
  total = 0;
  start = __rdtscp (&i);
  for (i = 0; i < loop; i++)
    total += foo_no_table (i);
  end = __rdtscp (&i);
  diff1 = end - start;

  printf ("global: %d, total: %d\n", global, total);
  printf ("no jump table: %lld\n", diff1);

  global = 20;
  total = 0;
  start = __rdtscp (&i);
  for (i = 0; i < loop; i++)
    total += foo (i);
  end = __rdtscp (&i);
  diff2 = end - start;

  printf ("global: %d, total: %d\n", global, total);
  printf ("jump table   : %lld (%.2f%%)\n",
	  diff2, 100.0f * diff2 / diff1);

  return 0;
}
