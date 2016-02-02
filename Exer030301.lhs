\begin{onlycompile}
\begin{code}
module Exer030301 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.3.1}

\verb$foldn Succ Zero n = n$が$Nat$のすべての要素$n$，すなわち，有限数，擬数，無限数で成り立つことを証明せよ．
\verb||

----

\verb|n|上の帰納法を使う．
\verb||
        
\begin{spec}
⊥の場合
   foldn Succ Zero ⊥
=  { foldn の定義．場合の枯渇 }
   ⊥

Zero の場合
   foldn Succ Zero Zero
=  { foldn の定義 }
   Zero

Succ n の場合
   foldn Succ Zero (Succ n)
=  { foldn の定義 }
   Succ (foldn Succ Zero n)
=  { 帰納法の仮定 }
   Succ n
\end{spec}
