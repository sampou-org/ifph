\begin{onlycompile}
\begin{code}
module Exer040601 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.1}
第3双対定理を証明せよ．
\verb||

----

第3双対定理

\begin{spec}
foldr f e xs = foldl (flip f) e (reverse xs)
\end{spec}

xs上の帰納法により証明

\begin{spec}
[]の場合：
    foldr f e []
=       { foldr の定義 }
    e
=       { foldl の定義 }
    foldl (flip f) e []
=       { reverse の定義 }
    foldl (flip f) e (reverse [])

(x:xs) の場合：
    foldr f e (x:xs)
=       { foldr の定義 }
    f x (foldr f e xs)
=       { 帰納法の仮定 }
    f x (foldl (flip f) e (reverse xs))
=       { flip の定義 }
    (flip f) (foldl (flip f) e (reverse xs)) x
=       { 任意の g について foldl g y [x] = g y x であるから }
    foldl (flip f) (foldl (flip f) e (reverse xs)) [x]
=       { 任意の g について foldl g e (xs ++ ys) = foldl g (foldl g e xs) ys だから }
    foldl (flip f) e (reverse xs ++ [x])
=       { reverse の定義 }
    foldl (flip f) e (reverse (x:xs))
\end{spec}