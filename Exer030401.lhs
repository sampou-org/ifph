\begin{onlycompile}
\begin{code}
module Exer030401 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.4.1}

\verb$3 `mod` (-4)$の値はいくつか．
\verb||

----

\verb|mod|はnon-restoring除算での余りなので符号は除数に一致する．
\verb||

\begin{spec}
? 3 `mod` (-4)
-1
\end{spec}
