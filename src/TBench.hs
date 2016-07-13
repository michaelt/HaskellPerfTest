
module TBench where

import Criterion
import Factored
import Foo
import Data.Int 

benches :: Benchmark
benches =
  let x = scalarFoo 0 :: Foo F128
  in bench "T" $ nf t x
  
benches' :: Benchmark
benches' =
  let x n = scalarFoo n :: Foo F128
  in bench "T\'" $ nf (t . x) 0
  
-- {-#INLINE benches_ #-}

benches_ :: Benchmark
benches_  = bench "T_" $ nf (t . (\n -> scalarFoo n :: Foo F128)) 0  

-- {-#INLINE benches'' #-}

benches'' :: Int64 -> Benchmark
benches'' m =
    let x = scalarFoo m :: Foo F128
    in bench "T\'\'" $ nf t x