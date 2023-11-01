#include <stdio.h>

char* fizzbuzz (int n) {
  if (n % 3 == 0 && n % 5 == 0) {
    return "fizzbuzz";
  } else if (n % 3 == 0) {
    return "fizz";
  } else if (n % 5 == 0) {
    return "buzz";
  } else {
    char str[20];
    sprintf(str, "%d", n);
    // this is bad, returning from stack, tsk tsk
    return str;
  }
}

int main (void) {
  puts(fizzbuzz(1));
  puts(fizzbuzz(3));
  puts(fizzbuzz(9));
  puts(fizzbuzz(5));
  puts(fizzbuzz(10));
  puts(fizzbuzz(1000));
  puts(fizzbuzz(15));

  return 0;
}
