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
1Mo
  ByteString.foldl: OK
    1.32 ms ± 121 μs
  FFI popcount:     OK
    50.0 ns ± 1.8 ns
10Mo
  ByteString.foldl: OK
    13.2 ms ± 723 μs
  FFI popcount:     OK
    61.2 ns ± 5.9 ns
100Mo
  ByteString.foldl: OK
    131  ms ± 3.2 ms
  FFI popcount:     OK
    38.8 ns ± 2.7 ns
```

With a GCC-enabled GHC 9.4.6:

```
1Mo
  ByteString.foldl: OK
    1.38 ms ± 106 μs
  FFI popcount:     OK
    63.6 ns ± 1.5 ns
10Mo
  ByteString.foldl: OK
    13.7 ms ± 1.4 ms
  FFI popcount:     OK
    88.5 ns ± 5.3 ns
100Mo
  ByteString.foldl: OK
    136  ms ± 2.8 ms
  FFI popcount:     OK
    39.5 ns ± 3.3 ns
```

## Toolchains

Use ghcup to install multiple toolchains:

Install a gcc-enabled GHC (Find the URL for your system [here](https://github.com/haskell/ghcup-metadata/blob/develop/ghcup-0.0.8.yaml#L4122))

* `ghcup install ghc -u 'https://downloads.haskell.org/~ghc/9.6.4/ghc-9.6.4-x86_64-fedora33-linux.tar.xz' 9.6.4-gcc`
* CC=clang CXX=clang++ ghcup install ghc --force 9.6.4

Then run:

```bash
$ cabal bench -w ghc-9.6.4
$ cabal clean # important!
$ cabal bench -w ghc-9.6.4-gcc
```
