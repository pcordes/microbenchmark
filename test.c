#include <stdio.h>
#include <x86intrin.h>

extern void jump (void);
extern void nopshort (void);
extern void noplong (void);

#define LOOP 3000

int
main ()
{
  int i;
  unsigned long long start, end;
  unsigned long long diff;

  start = __rdtsc ();
  for (i = 0; i < LOOP; i++)
    jump ();
  end = __rdtsc ();
  diff = end - start;

  printf ("jump     : %lld\n", diff);

  start = __rdtsc ();
  for (i = 0; i < LOOP; i++)
    nopshort ();
  end = __rdtsc ();
  diff = end - start;

  printf ("nopshort : %lld\n", diff);

  start = __rdtsc ();
  for (i = 0; i < LOOP; i++)
    noplong ();
  end = __rdtsc ();
  diff = end - start;

  printf ("noplong  : %lld\n", diff);

  return 0;
}
