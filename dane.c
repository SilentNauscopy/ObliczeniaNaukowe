#include <float.h>
#include <stdio.h>

int main(int argc, char const *argv[]) {
  /* code */
  printf("DBL_EPSILON = %g \n", LDBL_EPSILON);
  printf("DBL_EPSILON = %g \n", DBL_EPSILON);
  printf("FLT_EPSILON = %g \n", FLT_EPSILON);
  printf("FLT_EPSILON = %g \n", LDBL_MAX);
  printf("FLT_EPSILON = %g \n", DBL_MAX);
  printf("FLT_EPSILON = %g \n", FLT_MAX);
  return 0;
}
