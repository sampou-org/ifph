\begin{onlycompile}
\begin{code}
module Exer030102 where

data Nat = Zero | Succ Nat
  deriving (Eq,Ord,Show)
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.1.2}

自然数を整数に変換する関数\verb$convert :: Nat -> Integer$を定義せよ．
\verb||

----

\begin{code}
convert           ::  Nat -> Integer
convert Zero      =   0
convert (Succ n)  =   succ (convert n)
\end{code}