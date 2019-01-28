#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

extern void avx (__m128d, __m128d);
extern void avx2 (__m128d, __m128d);
extern void sse (__m128d, __m128d);
extern void avx_clear (__m128d, __m128d);
extern void sse_clear (__m128d, __m128d);

__m128d *xmm0;
__m128d *xmm1;
float f;

#define LOOP 3000000

int
main ()
{
  int i;
  unsigned long long start, end;
  unsigned long long diff;
  unsigned int aux;

  xmm0 = (__m128d *) malloc (LOOP * sizeof (*xmm0));
  xmm1 = (__m128d *) malloc (LOOP * sizeof (*xmm1));
  for (i = 0; i < LOOP; i++)
    {
      xmm0[i] = _mm_set1_pd (i + 1.23456);
      xmm1[i] = _mm_set1_pd (i + i + 3.7891);
    }

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    sse (xmm0[i], xmm1[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("sse      : %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    sse_clear (xmm0[i], xmm1[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("sse_clear: %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    avx (xmm0[i], xmm1[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("avx      : %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    avx2 (xmm0[i], xmm1[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("avx2     : %lld\n", diff);

  start = __rdtscp (&aux);
  for (i = 0; i < LOOP; i++)
    avx_clear (xmm0[i], xmm1[i]);
  end = __rdtscp (&aux);
  diff = end - start;

  printf ("avx_clear: %lld\n", diff);

  free (xmm0);
  free (xmm1);
  return 0;
}
