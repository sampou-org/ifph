\begin{onlycompile}
\begin{code}
module Exer040503 where

foo (x:xs) = foldl (-) x xs
bar (x:xs) = foldr (-) x xs
baz (x:xs) = x - sum xs
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.3}
以下の等式はどちらが正しいか．あるいは両方正しいか．

\begin{spec}
foldl (-) x xs = x - sum xs
foldr (-) x xs = x - sum xs
\end{spec}

\verb||

----

1つめの等式のみ正しい．
