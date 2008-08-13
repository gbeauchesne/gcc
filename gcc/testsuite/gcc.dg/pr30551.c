/* PR 30551 -Wmain is enabled by -Wall.  */
/* { dg-do compile } */
/* { dg-options "-Wall" } */

void main(char a) {} /* { dg-warning "first argument of .main. should be .int." } */
/* { dg-warning ".main. takes only zero or two arguments" "" { target *-*-* } 5 } */ 
/* { dg-warning "return type of .main. is not .int." "" { target *-*-* } 5 } */ 
