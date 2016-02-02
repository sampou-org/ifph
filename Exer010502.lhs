\begin{onlycompile}
\begin{code}
module Exer010502 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.5.2}

整数の絶対値を返す関数\verb|abs::Integer -> Integer|を定義せよ．
\verb||

----

\verb|abs|は\verb|Num|クラスのメソッドとして定義済みなので\verb|abs'|として定義する．
\verb||

\begin{code}
abs' :: Integer -> Integer
abs' x  = if x >= 0 then x else -x
\end{code}
