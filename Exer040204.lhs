\begin{onlycompile}
\begin{code}
module Exer040204 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.4}
\verb$concat (xss++yss) = concat xss ++ concat yss$であることを証明せよ．
\verb||

----

\begin{spec}
xss上の帰納法を使う

[] の場合

    concat ([] ++ yss)
=        { (++)の定義 }
    concat yss
=        { (++)の定義 }
    [] ++ concat yss
=        { concatの定義 }
    concat [] ++ concat yss

xs:xss の場合

    concat ((xs:xss) ++ yss)
=        { (++)の定義 }
    concat (xs:(xss ++ yss))
=        { concatの定義 }
    xs ++ concat (xss ++ yss)
=        { 帰納法の仮定 }
    xs ++ (concat xss ++ concat yss)
=        { (++)は結合的 }
    (xs ++ concat xss) ++ concat yss
=        { concatの定義 }
    concat (xs:xss) ++ concat yss
\end{spec}
