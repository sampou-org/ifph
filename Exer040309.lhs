\begin{onlycompile}
\begin{code}
module Exer040309 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.9}
\verb$pairs n$が\verb$1 ≦ x, y ≦ n$を満たすすべての整数の対\verb$(x,y)$の重複ない列挙になるような関数\verb$pairs$を定義せよ．
\verb||

----

\begin{code}
pairs :: Int -> [(Int,Int)]
pairs n = [(x,y) | x <- [1..n], y <- [x..n]]
\end{code}