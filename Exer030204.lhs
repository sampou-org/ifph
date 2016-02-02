\begin{onlycompile}
\begin{code}
module Exer030204 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.4}

\verb$+$が結合的であること，すなわち，任意の自然数\verb$m$，\verb$n$，\verb$p$に対して\verb$(m+n)+p = m+(n+p)$であることを証明せよ．
\verb||

----

\verb|p|上の帰納法
\verb||

\begin{spec}
⊥の場合
左辺
   (m + n) + ⊥
=  { + の定義．場合の枯渇 }
   ⊥
右辺
   m + (n + ⊥)
=  { + の定義．場合の枯渇 }
   m + ⊥
=  { + の定義．場合の枯渇 }
   ⊥

Zero の場合
左辺
   (m + n) + Zero
=  { + の定義 }
   m + n
右辺
   m + (n + Zero)
=  { + の定義 }
   m + n

Succ p の場合
   (m + n) + Succ p
=  { + の定義 }
   Succ ((m + n) + p)
=  { 帰納法の仮定 }
   Succ (m + (n + p))
=  { + の定義 }
   m + Succ (n + p)
=  { + の定義 }
   m + (n + Succ p)
\end{spec}
