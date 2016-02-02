\begin{onlycompile}
\begin{code}
module Exer040212 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.12}
以下を証明せよ．

\begin{spec}
(xs++ys) !! k = if k < n then xs !! k else ys !! (k-n)
                where n = length xs
\end{spec}

----

\begin{spec}
xs上の帰納法とkの場合分け

[],kの場合

左辺
    ([]++ys) !! k
=       { ++ の定義 }
    ys !! k
右辺
    if k < n then xs !! k else ys !! (k-n)
=       { n = length [] = 0 であるから k < n は False }
    ys !! (k-0)
=       { 算術 }
    ys !! k
    
x:xs, k = 0 の場合
左辺
    ((x:xs)++ys) !! 0
=       { ++ の定義 }
    (x:(xs++ys)) !! 0
=       { !! の定義 }
    x
右辺
    if k < n then (x:xs) !! k else ys !! (k-n)
=       { length (x:xs) = 1 + length xs > 0 = k だから }
    (x:xs) !! 0
=       { !! の定義 }
    x

x:xs, k+1の場合
左辺
    ((x:xs) ++ ys) !! (k+1)
=       { ++ の定義 }
    (x:(xs ++ ys)) !! (k+1)
=       { !! の定義 }
    (xs ++ ys) !! k
=       { 帰納法の仮定 }
    if k < n then xs !! k else ys !! (k-n)
右辺
    if (k+1) < n' then (x:xs) !! (k+1) else ys !! ((k+1)-n')
=       { n' = length (x:xs) = 1 + length xs = 1 + n = n + 1 だから }
    if (k+1) < (n+1) then (x:xs) !! (k+1) else ys !! ((k+1)-(n+1))
=       { k+1 < n+1 ⇔ k < n． !! の定義 }
    if k < n then xs !! k else ys !! (k-n)
\end{spec}
