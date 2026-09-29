#include <stddef.h>
#include <stdint.h>

extern void test_rvv(size_t, const uint8_t*, uint32_t*, const void*);
extern void write_message(const char*, size_t);
static uint8_t memory[4112] __attribute__((aligned(16)));
static uint8_t before[4112];
static char line[128];

static size_t number(size_t at, uint32_t n) {
  char digits[10];
  size_t len = 0;
  do { digits[len++] = '0' + n % 10; n /= 10; } while (n);
  while (len) line[at++] = digits[--len];
  return at;
}

int check_assembly(void) {
  const size_t lengths[] = {1,2,3,15,16,17,31,32,33,47,63,64,65,127,128,129,255,256,257,272,2049};
  const uint32_t olds[] = {0, 4294967280u};
  for (size_t k = 0; k < sizeof(lengths) / sizeof(lengths[0]); ++k) {
    const size_t n = lengths[k];
    for (size_t o = 0; o < 2; ++o) for (size_t alias = 0; alias < 2; ++alias) {
      const size_t out = alias ? 16 : 4096;
      for (size_t i = 0; i < sizeof(memory); ++i) memory[i] = 165;
      for (size_t i = 0; i < n; ++i) memory[16+i] = (i * 73 + 19) % 256;
      for (size_t i = 0; i < 4; ++i) memory[out+i] = olds[o] >> (8*i);
      for (size_t i = 0; i < sizeof(memory); ++i) before[i] = memory[i];
      uint32_t expected = olds[o];
      for (size_t i = 0; i < n; ++i) expected += memory[16+i];
      test_rvv(n, memory + 16, (uint32_t*)(memory + out), memory);
      uint32_t actual = 0;
      for (size_t i = 0; i < 4; ++i) actual |= (uint32_t)memory[out+i] << (8*i);
      if (actual != expected) return 1;
      for (size_t i = 0; i < sizeof(memory); ++i)
        if ((i < out || i >= out+4) && memory[i] != before[i]) return 2;
      size_t at = 0;
      at = number(at, n); line[at++] = ' ';
      at = number(at, olds[o]); line[at++] = ' ';
      at = number(at, alias); line[at++] = ' ';
      at = number(at, actual); line[at++] = '\n';
      write_message(line, at);
    }
  }
  return 0;
}
