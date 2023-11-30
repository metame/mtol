#include <stdio.h>
#include <stdlib.h>

const int program_inputs[] = {
    1, 3, 9, 5, 10, 1000, 15
};

/// =================== Approach 1: Global Buffer =======================
/**
 * This approach uses a global buffer of chars to store the result of fizzbuzz.
 * Sometimes when you implement arena allocator you reserve a large chunk of
 * memory beforehand and then use it to allocate smaller chunks. However, this
 * a very simple example so we'll just reuse the same buffer over and over.
*/

/**
 * @brief declare a global buffer and zero initialize it. This syntax is called
 * designated initializer and it's a C99 feature. Whenever you need to zero out a
 * struct or an array, you can use this syntax.
 * @example struct foo f = {0};
 * @example int arr[10] = {0};
 */
char buffer[256] = {0};

// char const* ensures that the string is not modified.
char const* fizzbuzz_v1(int n) {

    // This is approach to get the size of an array is valid since the compiler
    // can see the declaration of the array, and it knows the size of each element.
    // But in most cases, you won't be able to do this. For example, if you pass
    // an array to a function, the compiler won't know the size of the array due to array
    // decay.
    // Working:
    //      Step 1: int buffer_size = sizeof(buffer) / sizeof(buffer[0]);
    //      Step 2: int buffer_size = sizeof(char[256]) / sizeof(char);
    //      Step 3: int buffer_size = 256 * sizeof(char) / sizeof(char);
    //      Step 4: int buffer_size = 256 * 1 / 1;
    //      Step 5: int buffer_size = 256;
    const int buffer_size = sizeof(buffer) / sizeof(buffer[0]);
    int written_len = 0;

    if (n % 3 == 0 && n % 5 == 0) {
        // This function will ensure the buffer will not overflow.
        // If the buffer is not large enough, it will truncate the string.
        written_len = snprintf(buffer, buffer_size, "fizzbuzz");
    } else if (n % 3 == 0) {
        written_len = snprintf(buffer, buffer_size, "fizz");
    } else if (n % 5 == 0) {
        written_len = snprintf(buffer, buffer_size, "buzz");
    } else {
        written_len = snprintf(buffer, buffer_size, "%d", n);
    }
    
    // There might be cases where sprintf fails, so we need to check for.
    // You can ignore it if you want, but it's a good practice to check for
    // if (written_len < 0) {
    //     sprintf(stderr, "Error: sprintf failed\n");
    //     exit(1);
    // }

    // Here we are making sure the string is null terminated.
    buffer[written_len] = '\0';
    return buffer;
}

void fizzbuzz_v1_test() {
    const int len = sizeof(program_inputs) / sizeof(program_inputs[0]);
    for (int i = 0; i < len; i++) {
        printf("%s\n", fizzbuzz_v1(program_inputs[i]));
    }
}

// ========================================================================

// ========================== Approach 2: Heap ============================

// char* indicates that it's your responsibility to free the memory.
char* fizzbuzz_v2(int n) {
    // This is a heap allocated buffer. It's a good practice to check for
    // malloc failure.
    // Since malloc returns a void pointer, we need to cast it to char*. You can
    // ignore the warning if you want, but it's a good practice to cast it.
    // But now, it's your responsibility to free the memory.
    char* buffer = (char*)malloc(256);
    
    if (buffer == NULL) {
        fprintf(stderr, "Error: malloc failed\n");
        exit(1);
    }

    int written_len = 0;

    if (n % 3 == 0 && n % 5 == 0) {
        written_len = snprintf(buffer, 256, "fizzbuzz");
    } else if (n % 3 == 0) {
        written_len = snprintf(buffer, 256, "fizz");
    } else if (n % 5 == 0) {
        written_len = snprintf(buffer, 256, "buzz");
    } else {
        written_len = snprintf(buffer, 256, "%d", n);
    }

    buffer[written_len] = '\0';
    return buffer;
}

void fizzbuzz_v2_test() {
    const int len = sizeof(program_inputs) / sizeof(program_inputs[0]);
    for (int i = 0; i < len; i++) {
        char* result = fizzbuzz_v2(program_inputs[i]);
        printf("%s\n", result);
        
        // Don't forget to free the memory.
        // We free the memory after we are done with it, using "free" function.
        free(result);
    }
}

// ========================================================================

// ========================== Approach 3: Stack ============================

void fizzbuzz_v3(int n, char* buffer, int buffer_size) {
    int written_len = 0;

    if (n % 3 == 0 && n % 5 == 0) {
        written_len = snprintf(buffer, buffer_size, "fizzbuzz");
    } else if (n % 3 == 0) {
        written_len = snprintf(buffer, buffer_size, "fizz");
    } else if (n % 5 == 0) {
        written_len = snprintf(buffer, buffer_size, "buzz");
    } else {
        written_len = snprintf(buffer, buffer_size, "%d", n);
    }

    buffer[written_len] = '\0';
}

void fizzbuzz_v3_test() {
    const int len = sizeof(program_inputs) / sizeof(program_inputs[0]);
    
    for (int i = 0; i < len; i++) {
        // You can either put this buffer outside the loop or inside the loop.
        // I don't think it matters much in this case.
        char buffer[256] = {0};
        fizzbuzz_v3(program_inputs[i], buffer, sizeof(buffer));
        printf("%s\n", buffer);
    }
}

// ========================================================================

// ========================== Approach 4: Static ============================
char const* fizzbuzz_v4(int n) {
    // This is a static buffer, which means it's allocated in the data section
    // of the program. It's not allocated on the stack or heap. It's unique and 
    // shared by all the instances of this function.
    static char buffer[256] = {0};
    const int buffer_size = sizeof(buffer) / sizeof(buffer[0]);

    int written_len = 0;
    
    if (n % 3 == 0 && n % 5 == 0) {
        written_len = snprintf(buffer, buffer_size, "fizzbuzz");
    } else if (n % 3 == 0) {
        written_len = snprintf(buffer, buffer_size, "fizz");
    } else if (n % 5 == 0) {
        written_len = snprintf(buffer, buffer_size, "buzz");
    } else {
        written_len = snprintf(buffer, buffer_size, "%d", n);
    }

    buffer[written_len] = '\0';
    return buffer;
}

void fizzbuzz_v4_test() {
    const int len = sizeof(program_inputs) / sizeof(program_inputs[0]);
    for (int i = 0; i < len; i++) {
        printf("%s\n", fizzbuzz_v4(program_inputs[i]));
    }
}

// ========================================================================

int main (void) {
    printf("======= fizzbuzz_v1: with global buffer =======\n");
    fizzbuzz_v1_test();
    puts(""); // Puts by default adds a newline character.
    
    printf("======= fizzbuzz_v2: with heap =======\n");
    fizzbuzz_v2_test();
    puts(""); // Puts by default adds a newline character.

    printf("======= fizzbuzz_v3: with stack =======\n");
    fizzbuzz_v3_test();
    puts(""); // Puts by default adds a newline character.

    printf("======= fizzbuzz_v4: with static =======\n");
    fizzbuzz_v4_test();
    puts(""); // Puts by default adds a newline character.

  return 0;
}
