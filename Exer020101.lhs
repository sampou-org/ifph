\begin{onlycompile}
\begin{code}
module Exer020101 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.1}

∧(\verb|/\|)および∨(\verb|\/|)を条件式を用いて定義せよ．
\verb||

----

\begin{code}
infixr 3 /\
infixr 2 \/

(/\) :: Bool -> Bool -> Bool
p /\ q = if p then q else False

(\/) :: Bool -> Bool -> Bool
p \/ q = if p then True else q
\end{code}
