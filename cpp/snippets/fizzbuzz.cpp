#include <iostream>
#include <string>

std::string fizzbuzz(int x) {
  if (x % 3 == 0 && x % 5 == 0) {
    return "fizzbuzz";
  } else if (x % 3 == 0) {
    return "fizz";
  } else if (x % 5 == 0) {
    return "buzz";
  } else {
    std::string r = std::to_string(x);
    return r;
  }
}


int main(void) {
  std::cout << fizzbuzz(1) << std::endl;
  std::cout << fizzbuzz(3) << std::endl;
  std::cout << fizzbuzz(9) << std::endl;
  std::cout << fizzbuzz(5) << std::endl;
  std::cout << fizzbuzz(10) << std::endl;
  std::cout << fizzbuzz(1000) << std::endl;
  std::cout << fizzbuzz(15) << std::endl;

  return 0;
}
