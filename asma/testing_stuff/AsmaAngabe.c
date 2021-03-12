void asma(unsigned long x[], unsigned long y[], unsigned long sum[])  
{  
  unsigned long carry, sum0;  
  sum0 = x[0]+y[0];  
  carry = sum0<x[0];  
  sum[0] = sum0;  
  sum[1] = x[1]+y[1]+carry;  
}