
import FooBench
import BarBench
import TBench

import Criterion.Main

main :: IO ()
main = defaultMain [ FooBench.benches', TBench.benches', BarBench.benches'
                   , FooBench.benches'' 0, TBench.benches'' 0, BarBench.benches'' 0
                   , FooBench.benches_, TBench.benches_, BarBench.benches_
                   , FooBench.benches, TBench.benches, BarBench.benches]



