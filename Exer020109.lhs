\begin{onlycompile}
\begin{code}
module Exer020109 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.9}

すべてのインスタンス宣言で\verb|(<)|が満たすべき性質とは何か．
\verb||

----

\begin{itemize}
 \item **非反射律** \verb|not (a < a)|
 \item **推移律** \verb| a < b かつ b < c ならば a < c|
 \item **非対称律** \verb| a < b ならば not (b < a)|
\end{itemize}
