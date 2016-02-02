\begin{onlycompile}
\begin{code}
module Exer040301 where

square :: Num a => a -> a
square x = x * x
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.1}
\verb$map (map square) [[1,2],[3,4,5]]$を評価せよ．
\verb||

----

\begin{spec}
? map (map square) [[1,2],[3,4,5]]
[[1,4],[9,16,25]]
\end{spec}