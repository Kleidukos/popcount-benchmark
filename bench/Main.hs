{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Bits (popCount)
import Data.ByteString (StrictByteString)
import Data.ByteString qualified as ByteString
import Data.ByteString.Unsafe qualified as ByteString
import Data.Word (Word8)
import Foreign (Ptr)
import Foreign.C (CChar)
import Test.Tasty.Bench

main :: IO ()
main = defaultMain
  [ env (ByteString.readFile "1Mo.dat") $ \benchData ->  bgroup "1Mo"
      [ bench "ByteString.foldl" $ nf foldlPopcount benchData
      , bcompare "ByteString.foldl" $ bench "FFI popcount" $ nfAppIO ffiPopcount benchData
      ]
  , env (ByteString.readFile "10Mo.dat") $ \benchData ->  bgroup "10Mo"
      [ bench "ByteString.foldl" $ nf foldlPopcount benchData
      , bcompare "ByteString.foldl" $ bench "FFI popcount" $ nfAppIO ffiPopcount benchData
      ]
  , env (ByteString.readFile "100Mo.dat") $ \benchData ->  bgroup "100Mo"
      [ bench "ByteString.foldl" $ nf foldlPopcount benchData
      , bcompare "ByteString.foldl" $ bench "FFI popcount" $ nfAppIO ffiPopcount benchData
      ]
    ]

foldlPopcount :: StrictByteString -> Word8
foldlPopcount = ByteString.foldl1' (\acc element -> acc + fromIntegral (popCount element))

ffiPopcount :: StrictByteString -> IO Word8
ffiPopcount string = ByteString.unsafeUseAsCStringLen string $ \(cString, len) ->
  c_popcount cString (fromIntegral len)

foreign import capi "popcount.h popcount"
  c_popcount :: Ptr CChar -> Word8 -> IO Word8
