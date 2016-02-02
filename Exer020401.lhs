\begin{onlycompile}
\begin{code}
module Exer020401 where

pair           :: (a -> b, a -> c) -> a -> (b, c)
pair (f, g) x  =  (f x, g x)

cross         ::  (a -> b, c -> d) -> (a, c) -> (b, d)
cross (f, g)  =   pair (f . fst, g . snd)
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.4.1.}

\verb|cross (f, g) . cross (h, k) = cross (f . h, g . k)|であることを証明せよ．
\verb||

----

\begin{spec}
    (cross (f, g) . cross (h, k))
=   { crossの定義 }
    cross (f, g)  . pair (h . fst, k . snd)
=   { cross (f,g) . pair (h,k) = pair (f.h, g.k)であるから(p.42) }
    pair (f . (h . fst), g . (k . snd)) 
=   { (.)の結合性 }
    pair ((f . h) . fst, (g . k) . snd)
=   { crossの定義 }
    cross (f . h, g . k)
\end{spec}
