\begin{onlycompile}
\begin{code}
module Exer010602 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.6.2}

\verb|f :: (a,b) -> c|であるようなすべての\verb|f|に対して，以下を満たす関数\verb|swap|を定義せよ．
\verb||

\begin{spec}
flip (curry f) = curry (f . swap)
\end{spec}

----

\begin{spec}
    flip (curry f) = curry (f . swap)
=   { 外延性の原理 }
    flip (curry f) x y = curry (f . swap) x y
=   { flip の定義 }
    (curry f) y x = curry (f . swap) x y
=   { curry の定義 }
    f (y,x) = (f . swap) (x,y)
=   { (.) の定義 }
    f (y,x) = f (swap (x,y))
=   { Leibniz相等性 }
    (y,x) = swap (x,y)
\end{spec}

\begin{code}
swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)
\end{code}

