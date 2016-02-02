\begin{onlycompile}
\begin{code}
module Exer040203 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.3}
帰納法を使って，すべての\verb$xs$に対して\verb$xs ++ [] = xs$であることを証明せよ．
\verb||

----

\begin{spec}
xs上の帰納法を使う

[] の場合

    [] ++ []
=       { (++)の定義1つめの等式 }
    []

x : xs の場合

    (x : xs) ++ []
=       { (++)の定義2つめの等式 }
    x : (xs ++ [])
=       { 帰納法の仮定 }
    x : xs
\end{spec}

