
./dist-newstyle/build/x86_64-linux/ghc-9.6.4/popcount-benchmark-0.1.0.0/b/benchmark/build/benchmark/benchmark-tmp/cbits/popcount.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <popcount>:
#include <stddef.h>

size_t popcount (char const * src, size_t len) {
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
   0:	48 85 f6             	test   rsi,rsi
   3:	74 5c                	je     61 <popcount+0x61>
   5:	31 c9                	xor    ecx,ecx
   7:	31 c0                	xor    eax,eax
   9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
       result += __builtin_popcount(src[i]);
  10:	0f be 14 0f          	movsx  edx,BYTE PTR [rdi+rcx*1]
  14:	41 89 d0             	mov    r8d,edx
  17:	41 d1 e8             	shr    r8d,1
  1a:	41 81 e0 55 55 55 55 	and    r8d,0x55555555
  21:	44 29 c2             	sub    edx,r8d
  24:	41 89 d0             	mov    r8d,edx
  27:	41 81 e0 33 33 33 33 	and    r8d,0x33333333
  2e:	c1 ea 02             	shr    edx,0x2
  31:	81 e2 33 33 33 33    	and    edx,0x33333333
  37:	44 01 c2             	add    edx,r8d
  3a:	41 89 d0             	mov    r8d,edx
  3d:	41 c1 e8 04          	shr    r8d,0x4
  41:	41 01 d0             	add    r8d,edx
  44:	41 81 e0 0f 0f 0f 0f 	and    r8d,0xf0f0f0f
  4b:	41 69 d0 01 01 01 01 	imul   edx,r8d,0x1010101
  52:	c1 ea 18             	shr    edx,0x18
  55:	48 01 d0             	add    rax,rdx
   for (size_t i = 0; i < len; i++) {
  58:	48 ff c1             	inc    rcx
  5b:	48 39 ce             	cmp    rsi,rcx
  5e:	75 b0                	jne    10 <popcount+0x10>
   }
   return result;
  60:	c3                   	ret
  61:	31 c0                	xor    eax,eax
  63:	c3                   	ret
