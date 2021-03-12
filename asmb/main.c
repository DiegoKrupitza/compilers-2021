#include <stdio.h>
#include <string.h>
#include <mcheck.h>
#include <stdlib.h>

extern void asmb(unsigned long x[], unsigned long y[], unsigned long sum[], size_t n);
extern void asmb_callchecking(unsigned long x[], unsigned long y[], unsigned long sum[], size_t n);

void asmb_ref(unsigned long x[], unsigned long y[], unsigned long sum[], size_t n)
{
  unsigned long carry, s;
  size_t i;
  carry = 0;
  for (i = 0; i < n; i++)
  {
    s = x[i] + y[i] + carry;
    carry = carry ? s <= x[i] : s < x[i];
    sum[i] = s;
  }
  sum[i] = carry;
}

void pln(unsigned long x[], size_t n)
{
  size_t i;
  printf("0x");
  for (i = n; i > 0; i--)
    printf("%016lx", x[i - 1]);
}

int test(unsigned long x[], unsigned long y[], size_t n)
{
  int i;
  unsigned long x_ref[n], y_ref[n], sum_ref[n + 1], sum[n + 1];
  for (i = 0; i < n; i++)
  {
    x_ref[i] = x[i];
    y_ref[i] = y[i];
  }
  printf("                 ");
  pln(x, n);
  printf("\n+                ");
  pln(y, n);
  asmb(x, y, sum, n);
  for (i = 0; i < n; i++)
  {
    if (x_ref[i] != x[i] || y_ref[i] != y[i])
    {
      printf("\n[Errot] Eingabe veraendert\n");
      return 0;
    }
  }
  asmb_ref(x, y, sum_ref, n);
  for (i = 0; i < n + 1; i++)
  {
    if (sum_ref[i] != sum[i])
    {
      printf("\n[Error] Falsche Ausgabe an Stelle %d:\nWert: %016lx, erwartet: %016lx\n", i, sum[i], sum_ref[i]);
      return 0;
    }
  }
  printf("\n=");
  pln(sum, n + 1);
  printf("\n\n");
  return 1;
}

void myCustomTests()
{
  unsigned long a[] = {~0L, ~0, 1, 4, 0, 1, 1L << 63, 1L << 63, ~0, ~0, 0, 10};
  unsigned long specialStuff[] = {~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0,~0};
  unsigned long specialStuff2[] = {~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1,~0,1};
  int f;

  f = test(a, a + 2, 1);
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 8; j++)
    {
      f &= test(a, a + i, i);
      f &= test(a + i, a, i);

      f &= test(a, specialStuff + i, i);
      f &= test(a + i, specialStuff, i);
    }
  }

  if (!f)
    fprintf(stdout, "\nCustom Test failed.\n");
  else
    fprintf(stdout, "\nCustom Test succeeded.\n");
}

int main()
{
  unsigned long a[] = {~0L, 3, 1, 4, 0, 1, 1L << 63, 1L << 63, ~0, ~0, ~0};
  unsigned long b[] = {~0, ~1, ~0, 1};
  int f;

  f = test(a, a + 2, 2);
  f &= test(a, a + 4, 2);
  f &= test(a + 2, a, 2);
  f &= test(a + 6, a + 6, 2);
  f &= test(a + 8, a + 8, 3);
  f &= test(a, a + 2, 9);
  f &= test(a, a + 4, 7);
  f &= test(a + 2, a, 9);
  f &= test(a + 6, a + 6, 5);
  f &= test(a + 8, a + 8, 1);
  f &= test(a + 8, a + 8, 0);
  f &= test(b, b + 2, 2);
  f &= test(b + 2, b, 2);

  myCustomTests();

  if (!f)
    fprintf(stdout, "\nTest failed.\n");
  else
    fprintf(stdout, "\nTest succeeded.\n");
  return !f;
}
