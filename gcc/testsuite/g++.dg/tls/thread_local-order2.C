// The standard says that a1 should be destroyed before a0 even though
// that isn't reverse order of construction.  We need to move
// __cxa_thread_atexit into glibc to get this right.

// { dg-do run }
// { dg-require-effective-target c++11 }
// { dg-add-options tls }
// { dg-require-effective-target tls_runtime }
// { dg-xfail-run-if "" { { hppa*-*-hpux* *-*-solaris* } || { newlib } } }

#include <inttypes.h>
extern "C" void abort();
extern "C" int printf (const char *, ...);
#define printf(...)

int c;
struct A {
  int i;
  A(int i): i(i) { printf ("A(%d)\n", i); ++c; }
  // __cxa_thread_atexit() was moved into glibc 2.18
#if (defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 18))
  ~A() { printf("~A(%d)\n", i); if (i != --c) abort(); }
#endif
};

thread_local A a1(1);
A* ap = &a1;
A a0(0);

int main()
{
  if (c != 2) abort();
}
