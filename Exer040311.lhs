\begin{onlycompile}
\begin{code}
module Exer040311 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.11}
以下のリスト内包表記をコンビネータを用いたスタイルに変換せよ．

\begin{spec}
[(x,y) | x <- [1 .. n], odd x, y <- [1 .. n]]
[(x,y) | x <- [1 .. n], y <- [1 .. n], odd x]
\end{spec}

この2つは等しいか．2つの式の評価コストを比較せよ．
\verb||

----
\verb$[(x,y) | x <- [1..n], odd x, y <- [1..n]]$

\begin{spec}
    [(x,y) | x <- [1..n], odd x, y <- [1..n]]
=       { 生成規則 }
    concat (map f [1..n]) 
      where f x = [(x,y) | odd x, y <- [1..n]]
=       { ガード規則 }
    concat (map f [1..n]) 
      where f x = if odd x then [(x,y) | y <- [1..n]] else []
=       { 生成規則 }
    concat (map f [1..n]) 
      where f x = if odd x then concat (map g [1..n]) else []
                    where g y = (x,y)
\end{spec}

\verb$[(x,y) | x <- [1..n],  y <- [1..n], odd x]$

\begin{spec}
    [(x,y) | x <- [1..n],  y <- [1..n], odd x]
=       { 生成規則 }
    concat (map f xs)
      where f x = [ (x,y) | y <- [1 .. n], odd x ]
=       { 生成規則 }
    concat (map f [1..n])
      where f x = concat (map g [1..n]) 
                    where g y = [(x,y) | odd x]
=       { ガード規則 }
    concat (map f [1..n])
      where f x = concat (map g [1..n])
                    where g y = if odd x then [(x,y)] else []
\end{spec}

前者では odd x の検査が n 回，後者では n^2 回である．

