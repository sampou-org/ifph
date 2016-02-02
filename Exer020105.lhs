\begin{onlycompile}
\begin{code}
module Exer020105 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.5}

3つの整数を非減少順に並べる関数\verb|sort3|を定義せよ．
これにより関数\verb|analyse'|を定義して，引数が非減少順になっているという仮定に依存しないようにせよ．
\verb||

----

\begin{code}
sort3 :: (Int,Int,Int) -> (Int,Int,Int)
sort3 (x,y,z)
  | x > y      = sort3 (y,x,z)
  | y > z      = sort3 (x,z,y)
  | otherwise  = (x,y,z)
analyse'  :: (Int,Int,Int) -> Triangle
analyse' (x,y,z) = analyse (sort3 (x,y,z))

-- 以下は前問の解答を再掲

data Triangle = Failure | Isosceles | Equilateral | Scalene

analyse :: (Int,Int,Int) -> Triangle
analyse (x,y,z)
  | x == z                                  = Equilateral
  | x /= z && y == z                        = Isosceles
  | x + y > z && x /= z && y /= z && x == y = Isosceles
  | x + y > z && x /= z && y /= z && x /= y = Scalene
  | x + y <= z                              = Failure
\end{code}
