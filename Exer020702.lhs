\begin{onlycompile}
\begin{code}
module Exer020702 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.7.2}

以下の式の値はどうなるか．

\begin{spec}
show (show 42)
show 42 ++ show 42
show "\n"
\end{spec}

----

予想してから実際にやってみること．

\begin{spec}
? show (show 42)
"\"42\""
? show 42 ++ show 42
"4242"
? show "\n"
"\"\\n\""
\end{spec}

