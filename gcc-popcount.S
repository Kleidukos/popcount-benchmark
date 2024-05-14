
./dist-newstyle/build/x86_64-linux/ghc-9.6.4/popcount-benchmark-0.1.0.0/b/benchmark/build/benchmark/benchmark-tmp/cbits/popcount.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <popcount>:
#include <stddef.h>

size_t popcount (char const * src, size_t len) {
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
   0:	48 85 f6             	test   rsi,rsi
   3:	74 2b                	je     30 <popcount+0x30>
   5:	48 01 fe             	add    rsi,rdi
   size_t result = 0; 
   8:	31 d2                	xor    edx,edx
   a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
       result += __builtin_popcount(src[i]);
  10:	0f be 07             	movsx  eax,BYTE PTR [rdi]
   for (size_t i = 0; i < len; i++) {
  13:	48 83 c7 01          	add    rdi,0x1
       result += __builtin_popcount(src[i]);
  17:	f3 0f b8 c0          	popcnt eax,eax
  1b:	48 01 c2             	add    rdx,rax
   for (size_t i = 0; i < len; i++) {
  1e:	48 39 fe             	cmp    rsi,rdi
  21:	75 ed                	jne    10 <popcount+0x10>
   }
   return result;
}
  23:	48 89 d0             	mov    rax,rdx
  26:	c3                   	ret
  27:	66 0f 1f 84 00 00 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   size_t result = 0; 
  30:	31 d2                	xor    edx,edx
}
  32:	48 89 d0             	mov    rax,rdx
  35:	c3                   	ret
