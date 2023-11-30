#include <array>
#include <iostream>
#include <string>

// After C++17 or C++20, C++ added type deduction for class template argument.
// So, we can use std::array without specifying the type and size. Otherwise,
// we have to write like this:
//   static constexpr std::array<int, 10> program_input = {...};
static constexpr std::array program_input = {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
};

// ===================== Approach 1: Return the std::string (Original Code) =====================

// 1. "std::string" implements SOO (Small Object Optimization). SOO is a technique
// to avoid dynamic memory allocation by storing the data in the object itself using stack.
// The size of the object is the same as the size of the data it stores. However, if the
// size of the data exceeds the size of the object, the data is stored in the heap. In this
// case, the object stores a pointer to the data in the heap. Last time I checked, clang and gcc
// use 16 or 24 bytes for SOO. So, if the size of the data is 16 or 24 bytes or less, SOO is used. Otherwise,
// the data is stored in the heap.
// 2. C++ also performance RVO (Return Value Optimization) to avoid copying the return value. RVO is
// a technique to avoid copying the return value by constructing the return value in the caller's
// stack frame. In this case, the return value is constructed in the caller's stack frame, so the
// caller can use the return value without copying it.
// 3. Classes in C++ are copied using copy constructors. Copy constructors are called when the
// class is copied. If the class has a pointer, the pointer is copied. Therefore, the copy or move constructor will
// take care of returning string.
std::string fizzbuzz_v1(int x) {
    if (x % 3 == 0 && x % 5 == 0) {
        return "fizzbuzz";
    } else if (x % 3 == 0) {
        return "fizz";
    } else if (x % 5 == 0) {
        return "buzz";
    } else {
        return std::to_string(x);
    }
}

void fizzbuzz_v1_test() {
    for (auto x : program_input) {
        std::cout << fizzbuzz_v1(x) << std::endl;
    }
}

// ===============================================================================================

// ===================== Approach 2: Return the std::string by assigning to reference =====================

// 1. If we want to avoid copying the return value, we can use reference. In this case, we can use
// reference to std::string. However, we have to be careful about the lifetime of the return value.
// 2. Reference to std::string is a reference to a pointer. In c++'s world, reference is just a pointer but
// it's non-nullable and automatically dereferenced.
void fizzbuzz_v2(int n, std::string& res) {
    if (n % 3 == 0 && n % 5 == 0) {
        res = "fizzbuzz";
    } else if (n % 3 == 0) {
        res = "fizz";
    } else if (n % 5 == 0) {
        res = "buzz";
    } else {
        res = std::to_string(n);
    }
}

void fizzbuzz_v2_test() {
    std::string res;
    for (auto x : program_input) {
        fizzbuzz_v2(x, res);
        std::cout << res << std::endl;
        res.clear();
    }
}

// ===============================================================================================


int main(void) {
    std::cout<<"======= fizzbuzz_v1: Return the std::string ======="<<'\n';
    fizzbuzz_v1_test();
    std::cout << '\n';

    std::cout<<"======= fizzbuzz_v2: Return the std::string by assigning to reference ======="<<'\n';
    fizzbuzz_v2_test();
    std::cout << '\n';
    return 0;
}
