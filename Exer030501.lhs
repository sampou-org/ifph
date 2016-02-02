\begin{onlycompile}
\begin{code}
module Exer030501 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.5.1}

正の整数\verb$x$および\verb$y$について，\verb$x$が\verb$y$を割り切りかつ\verb$y$が\verb$x$を割り切るなら，\verb$x = y$である．
この事実を用いて，有理数は\verb$y > 0$かつ\verb$gcd (x,y) = 1$を満たす\verb$(x,y)$がそれぞれ唯一の表現になることを証明せよ．
\verb||

----

\begin{spec}
有理数p/qの表現を(x,y)および(x',y')とする．
いまq > 0を仮定しても一般性を失わないのでq > 0とする．
このとき正の整数m,nが存在して

   p/q = (m*x)/(m*y)  かつ  p/q = (n*x')/(n*y')

である．したがって，
  
   (m*x)/(m*y) = (n*x')/(n*y')

である．この等式の両辺に(m*y)*(n*y')をかけると

   (m*x)*(n*y') = (n*x')*(m*y)

である．さらに両辺をm * nで割ると

   x * y' = x' * y

となる．仮定より，x と y は互いに素なので，y' は y の倍数である．
また，x' と y' は互いに素なので，y は y' の倍数である．
すなわち，y と y' は互いに互いを割り切るので y = y' である．
同様の議論で，x = x'である．

したがって，有理数は y > 0 かつ gcd (x,y) = 1 を満たす (x,y) がそれぞれ唯一の表現になる．Q.E.D.
\end{spec}
