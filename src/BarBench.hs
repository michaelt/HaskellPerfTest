
module BarBench where

import Bar
import Criterion
import Factored
import Foo
import Data.Int

-- {-#INLINE benches #-}

benches :: Benchmark
benches =
  let x = Bar $ scalarFoo 0 :: Bar Foo F128
  in bench "Bar" $ nf bar x
  
-- {-#INLINE benches' #-}

benches' :: Benchmark
benches' =
    let x n = Bar $ scalarFoo n :: Bar Foo F128
    in bench "Bar" $ nf (bar . x) 0

-- {-#INLINE benches_ #-}

benches_ :: Benchmark
benches_ = bench "Bar" $ nf (bar . (\n -> Bar $ scalarFoo n :: Bar Foo F128)) 0  
-- {-#INLINE benches'' #-}
  
benches'' :: Int64 -> Benchmark
benches'' m =
  let x = Bar $ scalarFoo m :: Bar Foo F128
  in bench "Bar" $ nf bar x