\begin{onlycompile}
\begin{code}
module Exer030206 where
data Nat = Zero | Succ Nat
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.6}

verb$|~|$を以下のように定義する．
\verb||

\begin{code}
Zero   |~| n       = Zero
Succ m |~| Zero    = Zero
Succ m |~| Succ n  = Succ (m |~| n)
\end{code}

\verb$|~|$は整数上のどのような演算に対応しているか．
\verb$Nat$のすべての値，すなわち，有限値，擬値，無限値の\verb$m$に対して\verb$m |~| infinity = m$であることを証明せよ．
\verb||

----

自然数|m|，|n|に対して小さい方を返す関数．
\verb|m|上の帰納法．
\verb||

\begin{spec}
⊥ の場合
    ⊥ |~| infinity
=   { |~|の定義．場合の枯渇 }
    ⊥

Zero の場合
    Zero |~| ininity
=   { |~|の定義 }
    Zero

Succ m |~| infinity の場合
    Succ m |~| infinity
=   { infinity の定義 }
    Succ m |~| Succ infinity
=   { |~| の定義 }
    Succ (m |~| infinity)
=   { 帰納法の仮定 }
    Succ m

\end{spec}
