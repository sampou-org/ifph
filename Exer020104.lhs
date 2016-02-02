\begin{onlycompile}
\begin{code}
module Exer020104 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.4}

\verb|analyse|の定義を書き換えて，場合分けがその順序に依存しないようにせよ．
\verb||

----

\begin{code}
data Triangle = Failure | Isosceles | Equilateral | Scalene

analyse :: (Int,Int,Int) -> Triangle
analyse (x,y,z)
  | x == z                        = Equilateral
  | x /= z && y == z              = Isosceles
  | x + y > z && x /= z && x == y = Isosceles
  | x + y > z && x /= z && y /= z && x /= y = Scalene
  | x + y <= z                              = Failure
\end{code}

