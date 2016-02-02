\begin{onlycompile}
\begin{code}
module Exer030402 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.4.2}

\verb$y$が負のとき，\verb$y ＜ x `mod` y ≦ 0$であることを示せ．
\verb||

----

\begin{spec}
     x = (x `div` y) * y + (x `mod` y)
≡   { divの定義 }
     x = floor (x / y) * y + x `mod` y
≡   { x/y -1 ＜ floor (x/y) ≦ x/y かつ y ＜ 0 だから x ≦ floor (x/y) * y ＜ x - y  }
     
≡   { divの定義 }
     x + (x `mod` y) ≦ (x `div` y) * y + (x `mod` y)
     ∧ (x `div` y) * y + (x `mod` y) ＜ x - y + (x `mod` y)
≡   { 等式左辺右辺を1つめの不等式の両辺から引き，右辺左辺を2つめの不等式の両辺から引く }
     x `mod` y ≦ 0 ∧ 0 ＜ - y + (x `mod` y)
≡   { 2つめの不等式の変形 }
     x `mod` y ≦ 0 ∧ y ＜ x `mod` y
≡   { 統合 }
     y ＜ x `mod` y ≦ 0
\end{spec}
