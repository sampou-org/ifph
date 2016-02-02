\begin{onlycompile}
\begin{code}
module Exer010101 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.1.1}

関数\verb|square|を用いて引数を4乗する関数\verb|squad|を設計せよ．
\verb||

----

\begin{code}
square :: Integer -> Integer
square x = x * x

quad :: Integer -> Integer
quad x = square (square x)
\end{code}
