\begin{onlycompile}
\begin{code}
module Exer040510 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.10}
数学の定数 e は e = \sum_{n=0}^{\infty} 1/n! と定義されている．e をある十分な精度で求める式を書け．
\verb||

----

\begin{code}
e,e' :: Double
e  = sum $ takeWhile (> 0.0) $ scanl (/) 1 [1..]
e' = sum $ reverse $ takeWhile (> 0.0) $ scanl (/) 1 [1..]
\end{code}

\begin{spec}
? e - exp 1
4.440892098500626e-16
? e' - exp 1
0.0
\end{spec}