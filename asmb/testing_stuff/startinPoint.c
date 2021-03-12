#include <stddef.h>
/* x, y haben n Elemente, sum hat n+1 Elemente */
void asmb(unsigned long x[], unsigned long y[],
          unsigned long sum[], size_t n)
{
  unsigned long carry, s;  
  size_t i;  
  carry = 0;  
  for (i=0; i<n; i++) {  
    s = x[i]+y[i]+carry;  
    carry = carry ? s<=x[i] : s<x[i];  
    sum[i] = s;  
  }  
  sum[i] = carry;  
}