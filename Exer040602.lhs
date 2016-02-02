\begin{onlycompile}
\begin{code}
module Exer040602 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.2}
\verb$foldr$に対する融合定理を証明せよ．
\verb||

----

foldrの融合定理

\begin{spec}
f は正格，かつ，f a = b，かつ，f (g x y) = h x (f y) ならば
f . foldr g a = foldr h b
\end{spec}

xs上の帰納法により任意のxsについて以下が成り立つことを示す．
f (foldr g a xs) = foldr h b xs

\begin{spec}
[]の場合
    f (foldr g a [])
=       { foldr の定義 }
    f a
=       { f a = b だから }
    b
=       { foldr の定義 }
    foldr h b []

x:xs の場合
    f (foldr g a (x:xs))
=       { foldr の定義 }
    f (g x (foldr g a xs))
=       { f (g x y) = h x (f y) だから }
    h x (f (foldr g a xs))
=       { 帰納法の仮定 }
    h x (foldr h b xs)
=       { foldr の定義 }
    foldr h b (x:xs)
\end{spec}