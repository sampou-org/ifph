\begin{onlycompile}
\begin{code}
module Exer010402 where

square    ::  Num a => a -> a
square x  =   x * x
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.2}

先に定義した関数\verb|delta|の引数をカリー化して，\verb|delta (a,b,c)|と書かずに，\verb|delta a b c|と書けるようにしたとする．
このカリー化された版の型はどうなっているか．
\verb||

----

\begin{code}
delta' :: (Float,Float,Float) -> Float
delta' (a,b,c) = sqrt (square b - 4 * a * c)

delta        ::  Float -> (Float -> (Float -> Float))
delta a b c  =   delta' (a,b,c)
\end{code}
