\begin{onlycompile}
\begin{code}
module Exer040307 where

import Prelude hiding (takeWhile,dropWhile)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.7}
便利な関数\verb$takeWhile$および\verb$dropWhile$は，第1引数が自然数ではなく論理関数であることを除けば\verb$take$および\verb$drop$と同じである．
この点からいえば\verb$filter$ともよく似ている．
\verb$takeWhile p xs$の値は，\verb$xs$の先頭部分リストのうち，すべての要素について\verb$p$を満たす最長のものである．
例を挙げると次のとおり．

\begin{spec}
takeWhile even [2,4,6,1,5,6] = [2,4,6]
\end{spec}

\verb$dropWhile p xs$の値はその残りの部分である．
例を挙げると以下のとおり．
\verb||

\begin{spec}
dropWhile even [2,4,6,1,5,6] = [1,5,6]
\end{spec}

\verb$takeWhile$および\verb$dropWhile$を再帰的に定義せよ．
\verb||

----

\begin{code}
takeWhile           ::  (a -> Bool) -> [a] -> [a]
takeWhile _ []      =   []
takeWhile p (x:xs)
  | p x             =   x : takeWhile p xs
  | otherwise       =   []

dropWhile           ::  (a -> Bool) -> [a] -> [a]
dropWhile _ []      =   []
dropWhile p xxs@(x:xs)
  | p x             =   dropWhile p xs
  | otherwise       =   xxs
\end{code}
