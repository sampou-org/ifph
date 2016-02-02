\begin{onlycompile}
\begin{code}
module Exer040211 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.11}
すべての有限リスト\verb$xs$および自然数\verb$m$，\verb$n$について\verb$(drop m xs) !! n = xs !! (m+n)$が成り立つか．
\verb||

----

\begin{spec}
m 上の帰納法とxsの場合わけ

0,xsの場合
    (drop 0 xs) !! n
=       { dropの定義 }
    xs !! n
=       { 0は(+)の単位元 }
    xs !! (0 + n)

m+1,[]の場合
左辺
    (drop (m+1) []) !! n
=       { dropの定義 }
    [] !! n
=       { 場合の枯渇 }
    ⊥
右辺
    [] !! ((m+1)+n)
=       { 場合の枯渇 }
    ⊥

m+1,(x:xs)の場合

    (drop (m+1) (x:xs)) !! n 
=       { dropの定義 }
    (drop m xs) !! n
=       { 帰納法の仮定 }
    xs !! (m+n)
=       { (!!)の定義 }
    (x:xs) !! ((m+n)+1)
=       { (+)の結合性および可換性 }
    (x:xs) !! ((m+1)+n)
\end{spec}