\begin{onlycompile}
\begin{code}
module Exer030302 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.3.2}

融合法則を使って，\verb$+$が可換であることを証明せよ．
\verb||

----

\verb|n|上の帰納法を使う．
\verb||

\begin{spec}
Zero の場合
    m + Zero
=   { Zero は右単位元 }
    m
=   { Zero は左単位元 }
    Zero + m

Succ n の場合
    m + Succ n
=   { + の定義 }
    Succ (m + n)
=   { 帰納法の仮定 }
    Succ (n + m)
=   { + はfoldnのインスタンス }
    Succ (foldn Succ n m)
=   { (.) の定義 }
    (Succ . foldn Succ n) m
=   { 融合法則 f = Succ，g = Succ，h = Succ，a = n，b = Succ n }
    (foldn Succ (Succ n)) m
=   { 関数適用は左結合 }
    foldn Succ (Succ n) m
=   { + はfoldnのインスタンス }
    Succ n + m
\end{spec}
