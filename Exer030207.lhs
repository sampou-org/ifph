\begin{onlycompile}
\begin{code}
module Exer030207 where
data Nat = Zero | Succ Nat
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.7}

本文では，等式\verb$P(n)$がすべての擬数\verb$n$に対して成り立てば\verb$P(infinity)$も成り立つと主張している．
\verb$P$中のすべての自由変数は全称限量されていなければならない．
たとえば，以下の2つはどちらを\verb$P(n)$としても成り立つ．
\verb||

\begin{spec}
 すべての x および m に対して  x↑(m + n)   =  (x↑m) * (x↑n)
 すべての$m$に対して           (m + n) - n  =  m
\end{spec}

一般には等式\verb$P(n)$に存在限量された変数を含められない．
しかしながら，たとえば，以下のように定義された命題\verb$P(n)$を考える．
\verb||

\begin{spec}
ある有限数 m が存在して n `ominus` m = ⊥
\end{spec}

ここで，\verb$`ominus`$は減算の全域版であり，\verb$n < m$ならば\verb$n `ominus` m= Zero$である．
帰納法を用いて\verb$P(n)$が任意の擬数\verb$n$に対して成り立つことを示せ．
さらに，帰納法により，\verb$infinity `ominus` m = infinity$が任意の有限数\verb$m$について成り立つことを証明せよ．
\verb||

----

\begin{spec}
⊥の場合
    ⊥ `ominus` m
=   { ominus の定義．場合の枯渇 }
    ⊥
    この場合は任意の有限 m についてP(n)が成り立つ．
Succ n の場合
    帰納法の仮定より∃m : n `ominus` m = ⊥
    Succ n `ominus` Succ m
=   { ominus の定義 }
    n `ominus` m
=   { 帰納法の仮定 }
    ⊥
\end{spec}

\verb$infinity `ominus` m = infinity$は\verb|m|上の帰納法による
\verb||

\begin{spec}
Zeroの場合
    infinity `ominus` Zero
=   { ominusの定義 }
    infinity

Succ n の場合
    infinity `ominus` Succ n
=   { infinityの定義 }
    Succ infinity `ominus` Succ n
=   { ominusの定義 }
    infinity `ominus` n
=   { 帰納法の仮定 }
    infinity
\end{spec}


