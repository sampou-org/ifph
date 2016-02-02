\begin{onlycompile}
\begin{code}
module Exer040511 where

data Liste a = Nil | Snoc (Liste a) a
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.11}
練習問題[4.1.4](Exer040104.html)で定義した\verb$Liste a$型を考察しよう．
この型上の畳み込み関数は以下のように定義できる．
\verb||

\begin{code}
folde    ::  (b -> a -> b) -> b -> Liste a -> b
folde f e Nil         = e
folde f e (Snoc xs x) = f (folde f e xs) x
\end{code}

\verb$folde$に割り当てられる型は\verb$foldl$に割り当てられる型とほぼ同じである．
違いは，\verb$[a]$が\verb$Liste a$になっているところだけである．
実際，以下が成り立つ．
\verb||

\begin{spec}
folde f e = foldl f e . convert
\end{spec}

ここで，\verb$convert :: Liste a -> [a]$である．関数\verb$convert$を定義した上で，上の等式が成り立つことを帰納法で証明せよ．
\verb||

----

\begin{code}
convert              ::  Liste a -> [a]
convert Nil          =   []
convert (Snoc xs x)  =   convert xs ++ [x]
\end{code}

\begin{spec}
[] の場合：
    folde f e Nil
=       { folde の定義 }
    e
=       { foldl の定義 }
    foldl f e []
=       { convert の定義 }
    foldl f e (convert Nil)
=       { . の定義 }
    (foldl f e . convert) Nil

Snoc xs x の場合
    folde f e (Snoc xs x)
=       { folde の定義 }
    f (folde f e xs) x
=       { 帰納法の仮定 }
    f ((foldl f e . convert) xs) x
=       { . の定義 }
    f (foldl f e (convert xs)) x
=       { foldl の定義 }
    foldl f (f (foldl f e (convert xs)) x) []
=       { foldl の定義 }
    foldl f (foldl f e (convert xs)) (x:[])
=       { リストのリテラル表記 }
    foldl f (foldl f e (convert xs)) [x]
=       { (foldl f e (xs ++ ys) = foldl f (foldl f e xs) ys) だから }
    foldl f e (convert xs ++ [x])
=       { convert の定義 }
    foldl f e (convert (Snoc xs x))
=       { . の定義 }
    (foldl f e . convert) (Snoc xs x)
\end{spec}

主張：foldl f e (xs ++ ys) = foldl f (foldl f e xs) ys の証明は練習問題[4.6.4](Exer040604.html)参照
