\begin{onlycompile}
\begin{code}
module Exer040202 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.2}

すべての\verb$xs$について真となる等式はどれか，また偽となるのはどれか．
\verb||

\begin{spec}
[[]] ++ xs   = xs
[[]] ++ xs   = [xs]
[[]] ++ xs   = [[],xs]
[[]] ++ [xs] = [[],xs]
[xs] ++ []   = [xs]
[xs] ++ [xs] = [xs,xs]
\end{spec}

----

常に真なのは

\begin{spec}
[[]] ++ [xs] = [[],xs]
[xs] ++ []   = [xs]
[xs] ++ [xs] = [xs,xs]
\end{spec}

常に偽なのは

\begin{spec}
[[]] ++ xs   = xs
[[]] ++ xs   = [[],xs]
\end{spec}
