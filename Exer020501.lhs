\begin{onlycompile}
\begin{code}
module Exer020501 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.5.1.}

変換元の型が\verb$Either Bool Char$で，\verb$Left ⊥$，\verb$Right ⊥$，\verb$⊥$の3種類の引数に対して別々の振る舞いになるような関数を定義せよ．
\verb||

----

\begin{code}
isLeft            ::  Either Bool Char -> Bool
isLeft (Left _)   =   True
isLeft (Right _)  =   False
\end{code}
