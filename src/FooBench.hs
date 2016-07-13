
module FooBench where

import Criterion
import Factored
import Foo
import Data.Int
benches :: Benchmark
benches =
  let x = scalarFoo 0 :: Foo F128
  in bench "Foo" $ nf foo x
  
--

benches' :: Benchmark
benches' =
  let x n = scalarFoo n :: Foo F128
  in bench "Foo" $ nf (foo . x) 0
  
benches_ :: Benchmark
benches_ = bench "Foo" $ nf (foo . (\n -> scalarFoo n :: Foo F128)) 0

benches'' :: Int64 -> Benchmark
benches'' m =
  let x = scalarFoo m :: Foo F128
  in bench "Foo" $ nf foo x
  