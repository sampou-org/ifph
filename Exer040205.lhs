\begin{onlycompile}
\begin{code}
module Exer040205 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.5}
\verb$length (xs++ys) = length xs + length ys$であることを証明せよ．
\verb||

----

\begin{spec}
xs上の帰納法を使う

[] の場合

    length ([] ++ ys)
=        { (++)の定義 }
    length ys
=        { 0は(+)の単位元 }
    0 + length ys
=        { lengthの定義 }
    length [] + length ys

x:xs の場合

    length ((x:xs) ++ ys)
=        { (++)の定義 }
    length (x:(xs ++ ys))
=        { lengthの定義 }
    1 + length (xs ++ ys)
=        { 帰納法の仮定 }
    1 + (length xs + length ys)
=        { (+)は結合的 }
    (1 + length xs) + length ys
=        { lengthの定義 }
    length (x:xs) + length ys
\end{spec}
