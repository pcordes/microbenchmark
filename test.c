#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

extern void avx (int, __m128);
extern void sse (int, __m128);
extern void avx_clear (int, __m128);
extern void sse_clear (int, __m128);

__m128 *xmm;
float f;

#define LOOP 3000000

int
main ()
{
  int i;
  unsigned long long start, end;
  unsigned long long diff;
  unsigned int aux;

  xmm = (__m128 *) malloc (LOOP * sizeof (*xmm));
  for (i = 0; i < LOOP; i++)
    xmm[i] = _mm_set1_ps (i + 1.234567);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    sse (i + 1, xmm[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("sse      : %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    sse_clear (i + 1, xmm[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("sse_clear: %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    avx (i + 1, xmm[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("avx      : %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    avx_clear (i + 1, xmm[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("avx_clear: %lld\n", diff);

  free (xmm);

  return 0;
}
