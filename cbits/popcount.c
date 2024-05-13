#include <stddef.h>

size_t popcount (char const * src, size_t len) {
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
       result += __builtin_popcount(src[i]);
   }
   return result;
}
