\begin{onlycompile}
\begin{code}
module Exer010701 where

square :: Num a => a -> a
square x = x * x
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.7.1}

仕様に合う別の\verb|increase|の実装を与えよ．
\verb||

----

\begin{code}
increase x = 1 + square x
\end{code}

これが仕様を満すことは自明．

\begin{spec}
    increase x
=   { increase の定義 }
    1 + square x
>   { 自明 }
    square x
\end{spec}