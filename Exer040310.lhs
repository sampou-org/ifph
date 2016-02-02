\begin{onlycompile}
\begin{code}
module Exer040310 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.10}
\verb$0 < a,b,c,d ≦ n$の範囲で$a^{2} + b^{2} = c^{2} + d^{2}$を満たす本質的に異なる4つ組\verb$(a,b,c,d)$をすべて見つけるプログラムを書け．
\verb||

----
a == c ∧ b == d なものを省く

\begin{code}
quadruple :: Int -> [(Int,Int,Int,Int)]
quadruple n = [(a,b,c,d) | a <- [1..n], b <- [a..n], c <- [a+1..n], d <- [c..n], a^2+b^2 == c^2+d^2 ]
\end{code}

