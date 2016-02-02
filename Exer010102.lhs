\begin{onlycompile}
\begin{code}
module Exer010102 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.1.2}

2つの引数のうち大きいほうを返す関数\verb|greater|を定義せよ．
\verb||

----

\begin{code}
greater :: Integer -> Integer -> Integer
greater x y = if x > y then x else y
\end{code}
