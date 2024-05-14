
./dist-newstyle/build/x86_64-linux/ghc-9.6.4/popcount-benchmark-0.1.0.0/b/benchmark/build/benchmark/benchmark-tmp/cbits/popcount.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <popcount>:
#include <stddef.h>

size_t popcount (char const * src, size_t len) {
   0:	41 54                	push   r12
   2:	55                   	push   rbp
   3:	53                   	push   rbx
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
   4:	48 85 f6             	test   rsi,rsi
   7:	74 37                	je     40 <popcount+0x40>
   9:	48 89 fb             	mov    rbx,rdi
   c:	4c 8d 24 37          	lea    r12,[rdi+rsi*1]
   size_t result = 0; 
  10:	31 ed                	xor    ebp,ebp
  12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
       result += __builtin_popcount(src[i]);
  18:	0f be 3b             	movsx  edi,BYTE PTR [rbx]
   for (size_t i = 0; i < len; i++) {
  1b:	48 83 c3 01          	add    rbx,0x1
       result += __builtin_popcount(src[i]);
  1f:	e8 00 00 00 00       	call   24 <popcount+0x24>	20: R_X86_64_PLT32	__popcountdi2-0x4
  24:	48 98                	cdqe
  26:	48 01 c5             	add    rbp,rax
   for (size_t i = 0; i < len; i++) {
  29:	49 39 dc             	cmp    r12,rbx
  2c:	75 ea                	jne    18 <popcount+0x18>
   }
   return result;
}
  2e:	48 89 e8             	mov    rax,rbp
  31:	5b                   	pop    rbx
  32:	5d                   	pop    rbp
  33:	41 5c                	pop    r12
  35:	c3                   	ret
  36:	66 2e 0f 1f 84 00 00 00 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   size_t result = 0; 
  40:	31 ed                	xor    ebp,ebp
}
  42:	5b                   	pop    rbx
  43:	48 89 e8             	mov    rax,rbp
  46:	5d                   	pop    rbp
  47:	41 5c                	pop    r12
  49:	c3                   	ret
