#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static inline uint64_t pow2(uint8_t e) { return ((uint64_t)1) << e; }

uint64_t next_pow2_dichotomy(uint64_t x) {
  uint8_t lo = 0, hi = 63;
  while (lo < hi) {
    uint8_t test = (lo + hi) / 2;
    if (x < pow2(test)) {
      hi = test;
    } else if (pow2(test) < x) {
      lo = test + 1;
    } else {
      return pow2(test);
    }
  }
  return pow2(lo);
}

uint64_t next_pow2_bitshift_origin(uint64_t x) {
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 8;
  x |= x >> 16;
  x |= x >> 32;
  return x + 1;
}

uint64_t next_pow2_bitshift_new(uint64_t x) {
  uint64_t temp = x; // store the value of x
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 1;
  x |= x >> 8;
  x |= x >> 16;
  x |= x >> 32;
  if (temp == 0)
    return 1;
  return (x + 1) >> 1 == temp ? temp : x + 1;
}

uint64_t next_pow2_builtin(uint64_t x) {
  /*
  if((uint64_t)1 << 63 - __builtin_clzl(x) == x)
          return x;
  else
          return (uint64_t)1 << 63 - __builtin_clzl(x) + 1;
  */
  if (x == 0)
    return 1;
  return (uint64_t)1 << 63 - __builtin_clzl(x) == x
             ? x
             : (uint64_t)1 << 63 - __builtin_clzl(x) + 1;
}

int main() {
  uint64_t x;
  while (1) {
    printf("Enter a number x (uint64_t):");
    scanf("%ld", &x);
	printf("__builtin_clzl(0) = %d\n", __builtin_clzl(0));
    printf("__builtin_clzl(x) = %d\n", __builtin_clzl(x));
    printf("Using dichotomy: %ld\n", next_pow2_dichotomy(x));
    printf("Using bitshift_origin: %ld\n", next_pow2_bitshift_origin(x));
    printf("Using bitshift_new: %ld\n", next_pow2_bitshift_new(x));
    printf("Using builtin: %ld\n", next_pow2_builtin(x));
	printf("\n");
  }
  return 0;
}
