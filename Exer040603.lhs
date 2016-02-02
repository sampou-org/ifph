\begin{onlycompile}
\begin{code}
module Exer040603 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.3}
\verb$foldl$に対する融合定理は次のものである．\verb$f$が正格関数で\verb$f a = b$かつ任意の\verb$x$，\verb$y$について\verb$f (g x y)= h (f x) y$であるならば，\verb$f . foldl g a = foldl h b$である．
\verb||

帰納法による証明の中で場合\verb$(x:xs)$では，
\verb||

\begin{spec}
f (foldl g (g a x) xs) = foldl h (h (f a) x) xs
\end{spec}

であることを示す必要がある．そのためには2つめの帰納法の仮定，すなわち，任意の\verb$x$，\verb$y$および任意のリスト\verb$zs$において，
\verb||

\begin{spec}
f (foldl g (g x y) zs) = foldl h (h (f x) y) zs
\end{spec}

であることを使う必要がある．
この等式を証明し，\verb$foldl$に対する融合定理の証明を完成せよ．
\verb||

----

任意の\verb$x$，\verb$y$および任意のリスト\verb$zs$において，
\verb||

\begin{spec}
f (foldl g (g x y) zs) = foldl h (h (f x) y) zs
\end{spec}

であることをzs上の帰納法によって示す．

\begin{spec}
[] の場合
    f (foldl g (g x y) [])
=       { foldl の定義 }
    f (g x y)
=       { f (g x y) = h (f x) y だから }
    h (f x) y
=       { foldl の定義 }
    foldl h (h (f x) y) []

z:zs の場合
    f (foldl g (g x y) (z:zs))
=       { foldl の定義 }
    f (foldl g (g (g x y) z) zs)
=       { 帰納法の仮定 }
    foldl h (h (f (g x y)) z) zs
=       { foldl の定義 }
    foldl h (f (g x y)) (z:zs)
=       { f (g x y) = h (f x) y であるから }
    foldl h (h (f x) y) (z:zs)
\end{spec}

\verb|foldl|の融合定理
\verb||

\begin{spec}
f は正格，かつ，f a = b，かつ，任意の x，y に対して f (g x y) = h (f x) y ならば，任意のzsに対して
f (foldl g a zs) = foldl h b zs
\end{spec}

証明はzs上の帰納法による．

\begin{spec}
[]の場合
    f (foldl g a [])
=       { foldl の定義 }
    f a
=       { f a = b }
    b
=       { foldl の定義 }
    foldl h b []

x:xsの場合
    f (foldl g a (x:xs))
=       { foldl の定義 }
    f (foldl g (g a x) xs)
=       { f (foldl g (g x y) zs) = foldl h (h (f x) y) zs であるから }
    foldl h (h (f a) x) xs
=       { f a = b }
    foldl h (h b x) xs
=       { foldl の定義 }
    foldl h b (x:xs)
\end{spec}
