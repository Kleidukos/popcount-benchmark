# Popcount benchmark

This benchmark suite tests two popcount implementations:

* GHC-defined popcount on `Word8` is a combination of [`popCnt8#`](https://hackage.haskell.org/package/base-4.19.1.0/docs/GHC-Exts.html#v:popCnt8-35-) and ByteString's foldl'.
* C-defined popcount:

```c
size_t popcount (char const * src, size_t len) {
   size_t result = 0; 
   for (size_t i = 0; i < len; i++) {
       result += __builtin_popcount(src[i]);
   }
   return result;
}
```

## Result

With a clang-enabled GHC 9.6:

```
Benchmark
  ByteString.foldl: OK
    55.8 μs ± 2.8 μs
  FFI popcount:     OK
    56.3 ns ± 1.4 ns, 0.00x
```

With a GCC-enabled GHC 9.4.6:

```
Benchmark
  ByteString.foldl: OK
    55.0 μs ± 2.9 μs
  FFI popcount:     OK
    55.8 ns ± 1.4 ns, 0.00x
```

## Toolchains

Use ghcup to install multiple toolchains:

Install a gcc-enabled GHC (Find the URL for your system [here](https://github.com/haskell/ghcup-metadata/blob/develop/ghcup-0.0.8.yaml#L4122))

* `ghcup install ghc -u 'https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-fedora33-linux.tar.xz' 9.6.4-gcc`
* CC=clang CXX=clang++ ghcup install ghc --force 9.6.4

Then run:

```bash
$ cabal bench -w ghc-9.6.4
# and
$ cabal bench -w ghc-9.6.4-gcc
```
