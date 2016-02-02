\begin{onlycompile}
\begin{code}
module Exer040308 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.8}
\verb$xs$および\verb$ys$が以下の等式を満たす条件は何か．
\verb||

\begin{spec}
[ x | x <- xs, y <- ys] = [x | y <- ys, x <- xs]
\end{spec}


\verb||

----

length ys < 2 ∨ length xs < 2 ∨ xsの要素がすべて同じ
