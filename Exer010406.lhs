\begin{onlycompile}
\begin{code}
module Exer010406 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.6}

以下の表明のうち真であるものはどれか，あるだけ答えよ．

\begin{samplecode}
(*) x = (*x)
(+) x = (x+)
(-) x = (-x)
\end{samplecode}

----

\begin{samplecode}
(*) x = (*x)  偽：（交換律がなりたつなら真）
(+) x = (x+)  真：セクションの定義
(-) x = (-x)  偽：左辺の - は二項演算子，右辺の - は単項演算子
\end{samplecode}
