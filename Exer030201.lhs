\begin{onlycompile}
\begin{code}
module Exer030201 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.1}

\verb$Succ Zero$が\verb$×$に関して左単位元であることを証明せよ．
\verb||

----

\verb|Succ Zero × n = n|を\verb|n|上の帰納法で示す．
\verb||

\begin{spec}
Zero の場合

    Succ Zero × Zero
=   { ×の定義 }
    Zero

Succ n の場合
    Succ Zero × Succ n
=   { ×の定義 }
    (Succ Zero × n) ＋ Succ Zero
=   { 帰納法の仮定 }
    n + Succ Zero
=   { ＋の定義 }
    Succ (n + Zero)
=   { ＋の定義 }
    Succ n
\end{spec}
