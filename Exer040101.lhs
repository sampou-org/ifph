\begin{onlycompile}
\begin{code}
module Exer040101 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.1.1}
空リストが2箇所に現れるような式の例を示せ．ただし，1つめの空リストの型は\verb$[Bool]$であり，2つめの空リストの型は\verb$[Char]$とする．
\verb||

----

\begin{spec}
foldr (\ c (bs,cs) -> (isLower c:bs,c:cs)) ([],[]) "All about Haskell"
\end{spec}
