\begin{onlycompile}
\begin{code}
module Exer010604 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.6.4}

以下の関数に対して多相型を割り当てよ．

\begin{samplecode}
square x = x * x
\end{samplecode}

----

\verb|*|は型クラス\verb|Num|のメソッドである．
\verb||

\begin{code}
square :: Num a => a -> a
square x = x * x
\end{code}