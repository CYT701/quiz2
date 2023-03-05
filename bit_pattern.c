#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
bool is_pattern(uint16_t x) {
  if (!x)
    return 0;

  for (; x > 0; x <<= 1) {
    if (!(x & 0x8000))
      return false;
  }

  return true;
}

bool is_pattern_new(uint16_t x) {
  const uint16_t n = ~(x) + 1;
  return (n ^ x) < x;
}

int main() {
  uint16_t x;
  while (1) {
    printf("Enter a number (uint16_t) :");
    scanf("%hd", &x);
    printf("origin : %d", is_pattern(x));
    printf("\n");
    printf("new : %d", is_pattern_new(x));
    printf("\n");
  }
  return 0;
}
