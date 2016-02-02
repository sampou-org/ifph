\begin{onlycompile}
\begin{code}
module Exer030205 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.5}

\verb$*$が\verb$+$上で分配的であること，すなわち，任意の自然数\verb$k$，\verb$m$，\verb$n$に対して

\begin{spec}
k * (m + n) = (k * m) + (k * n)
\end{spec}

であることを証明せよ．
\verb||

----

\verb|n|上の帰納法による．
\verb||

\begin{spec}
⊥の場合
左辺
    k * (m + ⊥)
=   { + の定義．場合の枯渇 }
    k * ⊥
=   { * の定義．場合の枯渇 }
    ⊥
右辺
    (k * m) + (k * ⊥)
=   { * の定義．場合の枯渇 }
    (k * m) + ⊥
=   { + の定義．場合の枯渇 }
    ⊥

Zero の場合
    k * (m + Zero)
=   { + の定義 }
    k * m
=   { + の定義 }
    k * m + Zero
=   { * の定義 }
    k * m + k * Zero

Succ n の場合
    k * (m + Succ n)
=   { + の定義 }
    k * Succ (m + n)
=   { * の定義 }
    k * (m + n) + k
=   { 帰納法の仮定 }
    ((k * m) + (k * n)) + k
=   { + の結合性 }
    (k * m) + ((k * n) + k)
=   { * の定義 }
    (k * m) + (k * Succ n)
\end{spec}
