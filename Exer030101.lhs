\begin{onlycompile}
\begin{code}
module Exer030101 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.1.1}

正整数を再帰データ型として構成せよ．

----

\begin{code}
data PosInt = One | Suc PosInt 
  deriving (Eq,Ord,Show)
\end{code}