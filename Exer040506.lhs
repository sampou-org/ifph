\begin{onlycompile}
\begin{code}
module Exer040506 where
import Data.List
import Data.Ord
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.6}
数のリスト\verb$xs=[x_1,x_2,...,x_n]$が与えられているとき，先頭を含む最長単調増加部分列\verb$ssm xs$とは，\verb$j_1 = 1$で\verb$j < j_k$に対し\verb$x_j < x_{j_k}$であるような最長の部分列\verb$[x_{j_1},x_{j_2},...,x_{j_m}]$のことである．たとえば，\verb$[3,1,3,4,9,2,10,7]$の先頭を含む最長単調増加部分列は\verb$[3,4,9,10]$となる．関数\verb$foldl$を用いて\verb$ssm$を定義せよ．
\verb||

----

\begin{code}
ssm :: Ord a => [a] -> [a]
ssm = reverse . maximumBy (comparing length) . foldl f []
  where 
    f []  x = [[x]]
    f yss x = concatMap (ins x) yss
    ins x ys@(y:_) = ys : [ x:ys | x > y ]
\end{code}

