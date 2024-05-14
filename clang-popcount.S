
./dist-newstyle/build/x86_64-linux/ghc-9.6.4/popcount-benchmark-0.1.0.0/b/benchmark/build/benchmark/benchmark-tmp/cbits/popcount.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <popcount>:
#include <stddef.h>

size_t popcount (char const * src, size_t len) {
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
   0:	48 85 f6             	test   rsi,rsi
   3:	74 0f                	je     14 <popcount+0x14>
   5:	48 83 fe 10          	cmp    rsi,0x10
   9:	73 0c                	jae    17 <popcount+0x17>
   b:	31 c9                	xor    ecx,ecx
   d:	31 c0                	xor    eax,eax
   f:	e9 7c 01 00 00       	jmp    190 <popcount+0x190>
  14:	31 c0                	xor    eax,eax
       result += __builtin_popcount(src[i]);
   }
   return result;
  16:	c3                   	ret
   for (size_t i = 0; i < len; i++) {
  17:	48 89 f1             	mov    rcx,rsi
  1a:	48 83 e1 f0          	and    rcx,0xfffffffffffffff0
  1e:	c5 f9 ef c0          	vpxor  xmm0,xmm0,xmm0
  22:	31 c0                	xor    eax,eax
  24:	c4 e2 79 78 0d 00 00 00 00 	vpbroadcastb xmm1,BYTE PTR [rip+0x0]        # 2d <popcount+0x2d>	29: R_X86_64_PC32	.rodata-0x4
  2d:	c5 f9 6f 15 00 00 00 00 	vmovdqa xmm2,XMMWORD PTR [rip+0x0]        # 35 <popcount+0x35>	31: R_X86_64_PC32	.LCPI0_1-0x4
  35:	c5 e1 ef db          	vpxor  xmm3,xmm3,xmm3
  39:	c5 d9 ef e4          	vpxor  xmm4,xmm4,xmm4
  3d:	c5 d1 ef ed          	vpxor  xmm5,xmm5,xmm5
  41:	c5 c9 ef f6          	vpxor  xmm6,xmm6,xmm6
  45:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
       result += __builtin_popcount(src[i]);
  50:	c4 62 79 21 04 07    	vpmovsxbd xmm8,DWORD PTR [rdi+rax*1]
  56:	c4 62 79 21 4c 07 04 	vpmovsxbd xmm9,DWORD PTR [rdi+rax*1+0x4]
  5d:	c4 62 79 21 54 07 08 	vpmovsxbd xmm10,DWORD PTR [rdi+rax*1+0x8]
  64:	c4 e2 79 21 7c 07 0c 	vpmovsxbd xmm7,DWORD PTR [rdi+rax*1+0xc]
  6b:	c5 39 db d9          	vpand  xmm11,xmm8,xmm1
  6f:	c4 42 69 00 db       	vpshufb xmm11,xmm2,xmm11
  74:	c4 c1 39 71 d0 04    	vpsrlw xmm8,xmm8,0x4
  7a:	c5 39 db c1          	vpand  xmm8,xmm8,xmm1
  7e:	c4 42 69 00 c0       	vpshufb xmm8,xmm2,xmm8
  83:	c4 41 39 fc c3       	vpaddb xmm8,xmm8,xmm11
  88:	c5 39 6a db          	vpunpckhdq xmm11,xmm8,xmm3
  8c:	c5 21 f6 db          	vpsadbw xmm11,xmm11,xmm3
  90:	c4 42 79 35 c0       	vpmovzxdq xmm8,xmm8
  95:	c5 39 f6 c3          	vpsadbw xmm8,xmm8,xmm3
  99:	c4 41 39 67 c3       	vpackuswb xmm8,xmm8,xmm11
  9e:	c5 31 db d9          	vpand  xmm11,xmm9,xmm1
  a2:	c4 42 69 00 db       	vpshufb xmm11,xmm2,xmm11
  a7:	c4 c1 31 71 d1 04    	vpsrlw xmm9,xmm9,0x4
  ad:	c5 31 db c9          	vpand  xmm9,xmm9,xmm1
  b1:	c4 42 69 00 c9       	vpshufb xmm9,xmm2,xmm9
  b6:	c4 41 31 fc cb       	vpaddb xmm9,xmm9,xmm11
  bb:	c5 31 6a db          	vpunpckhdq xmm11,xmm9,xmm3
  bf:	c5 21 f6 db          	vpsadbw xmm11,xmm11,xmm3
  c3:	c4 42 79 35 c9       	vpmovzxdq xmm9,xmm9
  c8:	c5 31 f6 cb          	vpsadbw xmm9,xmm9,xmm3
  cc:	c4 41 31 67 cb       	vpackuswb xmm9,xmm9,xmm11
  d1:	c5 29 db d9          	vpand  xmm11,xmm10,xmm1
  d5:	c4 42 69 00 db       	vpshufb xmm11,xmm2,xmm11
  da:	c4 c1 29 71 d2 04    	vpsrlw xmm10,xmm10,0x4
  e0:	c5 29 db d1          	vpand  xmm10,xmm10,xmm1
  e4:	c4 42 69 00 d2       	vpshufb xmm10,xmm2,xmm10
  e9:	c4 41 29 fc d3       	vpaddb xmm10,xmm10,xmm11
  ee:	c5 29 6a db          	vpunpckhdq xmm11,xmm10,xmm3
  f2:	c5 21 f6 db          	vpsadbw xmm11,xmm11,xmm3
  f6:	c4 42 79 35 d2       	vpmovzxdq xmm10,xmm10
  fb:	c5 29 f6 d3          	vpsadbw xmm10,xmm10,xmm3
  ff:	c4 41 29 67 d3       	vpackuswb xmm10,xmm10,xmm11
 104:	c5 41 db d9          	vpand  xmm11,xmm7,xmm1
 108:	c4 42 69 00 db       	vpshufb xmm11,xmm2,xmm11
 10d:	c5 c1 71 d7 04       	vpsrlw xmm7,xmm7,0x4
 112:	c5 c1 db f9          	vpand  xmm7,xmm7,xmm1
 116:	c4 e2 69 00 ff       	vpshufb xmm7,xmm2,xmm7
 11b:	c5 a1 fc ff          	vpaddb xmm7,xmm11,xmm7
 11f:	c5 41 6a db          	vpunpckhdq xmm11,xmm7,xmm3
 123:	c5 21 f6 db          	vpsadbw xmm11,xmm11,xmm3
 127:	c4 e2 79 35 ff       	vpmovzxdq xmm7,xmm7
 12c:	c5 c1 f6 fb          	vpsadbw xmm7,xmm7,xmm3
 130:	c4 c1 41 67 fb       	vpackuswb xmm7,xmm7,xmm11
 135:	c4 42 7d 35 c0       	vpmovzxdq ymm8,xmm8
 13a:	c5 bd d4 c0          	vpaddq ymm0,ymm8,ymm0
 13e:	c4 42 7d 35 c1       	vpmovzxdq ymm8,xmm9
 143:	c5 bd d4 e4          	vpaddq ymm4,ymm8,ymm4
 147:	c4 42 7d 35 c2       	vpmovzxdq ymm8,xmm10
 14c:	c5 bd d4 ed          	vpaddq ymm5,ymm8,ymm5
 150:	c4 e2 7d 35 ff       	vpmovzxdq ymm7,xmm7
 155:	c5 cd d4 f7          	vpaddq ymm6,ymm6,ymm7
   for (size_t i = 0; i < len; i++) {
 159:	48 83 c0 10          	add    rax,0x10
 15d:	48 39 c1             	cmp    rcx,rax
 160:	0f 85 ea fe ff ff    	jne    50 <popcount+0x50>
 166:	c5 dd d4 c0          	vpaddq ymm0,ymm4,ymm0
 16a:	c5 d5 d4 c0          	vpaddq ymm0,ymm5,ymm0
 16e:	c5 cd d4 c0          	vpaddq ymm0,ymm6,ymm0
 172:	c4 e3 7d 39 c1 01    	vextracti128 xmm1,ymm0,0x1
 178:	c5 f9 d4 c1          	vpaddq xmm0,xmm0,xmm1
 17c:	c5 f9 70 c8 ee       	vpshufd xmm1,xmm0,0xee
 181:	c5 f9 d4 c1          	vpaddq xmm0,xmm0,xmm1
 185:	c4 e1 f9 7e c0       	vmovq  rax,xmm0
 18a:	48 39 f1             	cmp    rcx,rsi
 18d:	74 14                	je     1a3 <popcount+0x1a3>
 18f:	90                   	nop
       result += __builtin_popcount(src[i]);
 190:	0f be 14 0f          	movsx  edx,BYTE PTR [rdi+rcx*1]
 194:	f3 0f b8 d2          	popcnt edx,edx
 198:	48 01 d0             	add    rax,rdx
   for (size_t i = 0; i < len; i++) {
 19b:	48 ff c1             	inc    rcx
 19e:	48 39 ce             	cmp    rsi,rcx
 1a1:	75 ed                	jne    190 <popcount+0x190>
   return result;
 1a3:	c5 f8 77             	vzeroupper
 1a6:	c3                   	ret
