\begin{onlycompile}
\begin{code}
module Exer040303 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.3}
\verb$map map$の型は何か．
\verb||

----

\begin{spec}
map map :: [a -> b] -> [[a] -> [b]]
\end{spec}
