\begin{onlycompile}
\begin{code}
module Exer020102 where

(\/
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.2}

論理において⇒で表される含意は，x⇒yが\verb|False|になるのはxが真でかつyが偽の場合に限ると定義されている．
含意を\verb|Bool|上の演算として形式的な定義を与えよ．
\verb||

----

⇒は\verb|=>>|と書くことにする．
\verb||

\begin{code}
infixr 1 =>>

(=>>) :: Bool -> Bool -> Bool
p =>> q = not p \/ q
\end{code}
