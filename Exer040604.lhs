\begin{onlycompile}
\begin{code}
module Exer040604 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.4}
以下の等式を証明せよ．

\begin{spec}
foldr f a (xs++ys) = foldr f (foldr f a ys) xs
foldl f a (xs++ys) = foldl f (foldl f a xs) ys
\end{spec}

もし必要だとすれば，\verb$xs$，\verb$ys$に対してどのような制限が必要か．
\verb||

----

foldr f a (xs++ys) = foldr f (foldr f a ys) xs の証明は xs 上の帰納法でおこなう．

\begin{spec}
⊥の場合
    foldr f a (⊥++ys)
=       { ++ の定義，場合の枯渇 }
    foldr f a ⊥
=       { foldr の定義，場合の枯渇 }
    ⊥
=       { foldr の定義，場合の枯渇 }
    foldr f (foldr f a ys) ⊥

[]の場合
    foldr f a ([]++ys)
=       { ++ の定義 }
    foldr f a ys
=       { foldr の定義 }
    foldr f (foldr f a ys) []

x:xs の場合
    foldr f a (x:xs ++ ys)
=       { ++ の定義 }
    foldr f a (x:(xs ++ ys))
=       { foldr の定義 }
    f x (foldr f a (xs++ys))
=       { 帰納法の仮定 }
    f x (foldr f (foldr f a ys) xs)
=       { foldr の定義 }
    foldr f (foldr f a ys) (x:xs)
\end{spec}

foldl f a (xs++ys) = foldl f (foldl f a xs) ys の証明は xs 上の帰納法でおこなう．

\begin{spec}
⊥の場合

    foldl f a (⊥++ys)
=       { ++ の定義，場合の枯渇 }
    foldl f a ⊥
=       { foldl の定義，場合の枯渇 }
    ⊥

    foldl f (foldl f a []) ys
=       { foldl の定義，場合の枯渇 }
    foldl f ⊥ ys

一般には ⊥ ＝ foldl f ⊥ ys ではない．

[]の場合
    foldl f a ([]++ys)
=       { ++ の定義 }
    foldl f a ys
=       { foldl の定義 }
    foldl f (fold f a []) ys

x:xs の場合
    foldl f a ((x:xs)++ys)
=       { ++ の定義 }
    foldl f a (x:(xs++ys))
=       { foldl の定義 }
    foldl f (f a x) (xs++ys)
=       { 帰納法の仮定 }
    foldl f (foldl f (f a x) xs) ys
=       { foldl の定義 }
    foldl f (foldl f a (x:xs)) ys
\end{spec}

foldr に関する法則の場合は任意のxs，ysについて成り立つ
foldl に関する法則の場合は任意の有限リストxs，と任意のリストysについて成り立つ
