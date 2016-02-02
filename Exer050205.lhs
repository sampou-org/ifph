\begin{onlycompile}
\begin{code}
module Exer050205 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.2.5}

実は関数\verb$sortby$は，より一般的な以下の型を持つ関数\verb$sortwith$ほどには役に立たない．
\verb||

\begin{spec}
sortwith :: (a -> a -> Bool) -> [a] -> [a]
\end{spec}

仕様としては，\verb$sortwith compare xs$は以下を満たす\verb$xs$を並び換えた$ys$である．
\verb||

\begin{spec}
and [compare x y | (x,y) <- zip ys (tail ys)]
\end{spec}

\verb$sortwith$を用いて成績表のアルゴリズムを書き直せ．
新しいアルゴリズムではリストを逆転する必要がない理由を示せ．
\verb||

----

sortwith f の逆順ソートは sortwith (flip f) であるから．．．