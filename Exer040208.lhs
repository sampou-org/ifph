\begin{onlycompile}
\begin{code}
module Exer040208 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.8}
\verb$(:)$のパターン照合を使って長さ2のリストのみ逆転し，それ以外のリストはそのままにするような関数\verb$rev2$を定義せよ．
漏れがなく，重なりのないパターンになるようにすること．
\verb||

----

\begin{code}
rev2 :: [a] -> [a]
rev2 xs@[]        = xs
rev2 xs@(_:[])    = xs
rev2 xs@(_:_:[])  = reverse xs
rev2 xs@(_:_:_:_) = xs
\end{code}
