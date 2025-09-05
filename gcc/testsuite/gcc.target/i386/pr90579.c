/* { dg-do compile } */
/* { dg-options "-O3 -mavx2 -mfpmath=sse -fno-pie" } */

extern double r[6];
extern double a[];

double
loop (int k, double x)
{
  int i;
  double t=0;
  for (i=0;i<6;i++)
    r[i] = x * a[i + k];
  for (i=0;i<6;i++)
    t+=r[5-i];
  return t;
}

/* Verify we end up with scalar loads from r for the final sum.  */
/* { dg-final { scan-assembler "vaddsd\t\(r\\\+40\|40\\\+r\)" } } */
/* { dg-final { scan-assembler "vaddsd\t\(r\\\+32\|32\\\+r\)" } } */
/* { dg-final { scan-assembler "vaddsd\t\(r\\\+24\|24\\\+r\)" } } */
/* { dg-final { scan-assembler "vaddsd\t\(r\\\+16\|16\\\+r\)" } } */
