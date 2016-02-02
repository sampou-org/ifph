\begin{onlycompile}
\begin{code}
module Exer030103 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.1.3}

1つめの引数上のパターン照合を使って\verb$＋$および\verb$×$を定義せよ．同様に\verb$↑$を定義できるか．
\verb||

----

\begin{spec}
(＋) :: Nat -> Nat -> Nat
Zero     ＋ n = n
(Succ m) ＋ n = m ＋ Succ n

(×) :: Nat -> Nat -> Nat
Zero     × n = Zero
(Succ m) × n = m × n ＋ n
\end{spec}

\verb|↑|については2つめの引数上で再帰的に定義するので，2つめの引数のパターン照合が必要である．
\verb||

\begin{spec}
(↑)          :: Nat -> Nat -> Nat
m ↑ Zero     =  Succ Zero
m ↑ (Succ n) =  m × (m ↑ n)
\end{spec}
