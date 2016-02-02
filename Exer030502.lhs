\begin{onlycompile}
\begin{code}
module Exer030502 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.5.2}

整数\verb$x$は\verb$x= 10 * y + z$を満たす整数の対\verb$(y,z)$で表現できる．
たとえば，\verb$27$は\verb$(2,7)$，\verb$(3,-3)$，\verb$(1,17)$さらに他の対で表現できる．
可能な表現の中から，\verb$-5 <= z < 5$かつ\verb$abs y$ができるだけ小さくなるように選べる．
どの整数もこの方法で唯一に表現できることを示し，\verb$repint x$が整数\verb$x$のこの標準表現を返すように関数\verb$repint$を定義せよ．\verb||

----

\begin{spec}
  q = x `div` 10
  r = x `mod` 10     
  とすると
  x = q * 10 + r   (1)
  0 ≦ r ＜ 10     (2)
  したがって，任意の整数 x は対(q,r)で一意に表現できる．
  また(1)を変形すると
  x = (q+1) * 10 + (r-10)   (3)
  であるから，任意の整数 x は対(q+1,r-10)で一意に表現できる．
  x `mod` 10 ＜ 5 の場合は y = q,   z = r
  5 ≦ x `mod` 10 の場合は y = q+1, z = r - 10
  とすれば，y および z は問題の仕様を満す．
\end{spec}

\verb|repint|の定義は以下のとおり．
\verb||

\begin{code}
repint    ::  Integer -> (Integer,Integer)
repint x  =   if r < 5 then (q,r) else (q+1,r-10)
  where
    (q,r) = x `divMod` 10
\end{code}
