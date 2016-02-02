\begin{onlycompile}
\begin{code}
module Exer040608 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.8}
\verb$foldr1$に対する融合法則を示し，それを使って，以下の法則が正しくなるための\verb$f$，\verb$g$，\verb$h$の条件を示せ．
\verb||

\begin{spec}
foldr1 f . scanl1 g = foldr1 h
\end{spec}

----

foldr1 に対する融合定理

\begin{spec}
    maphd f (x:xs) = f x : xs としたとき

    f は正格関数 ∧ f (g x y) = h x (f y) 
⇒
    f . foldr1 g = foldr1 h . maphd f
\end{spec}

運算は f (foldr1 g (x:xs)) = foldr1 h (maphd f (x:xs)) を xs に関する帰納法で示す．

\begin{spec}
[]の場合
    f (foldr1 g (x:[]))
=        { foldr1 の定義 }
    f x
=        { foldr1 の定義 }
    foldr1 h (f x: [])
=       { maphd の定義 }
    foldr1 h (maphd f (x:[]))

y:ysの場合
    f (foldr1 g (x:y:ys))
=       { foldr1 g の定義 }
    f (g x (foldr1 g (y:ys)))
=       { 帰納法の仮定 g x (g y ys) = h x (g x ys) }
    f (foldr1 h (maphd (g x) (y:ys)))
=       { maphd の定義 }
    f (foldr1 h (g x y : ys))

    foldr1 h (h x (f (g x y)) : ys)
=       { maphd の定義 }

=   (h . f) x (foldr h 
    h (f x) (foldr1 h (y:ys))
=       { foldr1 の定義 }
    foldr1 h (f x : y : ys)
=       { maphd の定義 }
    foldr1 h (maphd f (x:y:ys))
\end{spec}

