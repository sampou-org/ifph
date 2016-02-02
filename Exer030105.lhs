\begin{onlycompile}
\begin{code}
module Exer030105 where
data Nat = Zero | Succ Nat
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.1.5}

\verb|m < n|の場合は\verb|m `ominus` n= Zero|となる，減算の全域版\verb|`ominus`|を定義せよ．
\verb||

----

\begin{code}
ominus                     ::  Nat -> Nat -> Nat
m        `ominus` Zero     =   m
Zero     `ominus` _        =   Zero
(Succ m) `ominus` (Succ n) =   m `ominus` n
\end{code}
