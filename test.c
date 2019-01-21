#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

extern double int128_double_libgcc2 (__int128);
extern double int128_double_soft_fp (__int128);

#define LOOP 300000000

int
main (int argc, char **argv)
{
  int i, loop;
  double total;
  unsigned long long start, end;
  unsigned long long diff1, diff2;

  loop = 0;
  if (argc > 1)
    loop = atoi (argv[1]);
  if (loop <= 0)
    loop = LOOP;

  printf ("%d loops:\n", loop);

  total = 0;
  start = __rdtscp (&i);
  for (i = 0; i < loop; i++)
    total += int128_double_libgcc2 ((__int128) i);
  end = __rdtscp (&i);
  diff1 = end - start;

  printf ("total  : %.10e\n", total);
  printf ("libgcc2: %lld\n", diff1);

  total = 0;
  start = __rdtscp (&i);
  for (i = 0; i < loop; i++)
    total += int128_double_soft_fp ((__int128) i);
  end = __rdtscp (&i);
  diff2 = end - start;

  printf ("total  : %.10e\n", total);
  printf ("soft-fp: %lld (%.2f%%)\n",
	  diff2, 100.0f * diff2 / diff1);

  return 0;
}
