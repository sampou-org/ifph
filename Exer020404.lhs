\begin{onlycompile}
\begin{code}
module Exer020404 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.4.4.}

\verb|a|および\verb|b|がともに型クラス\verb$Enum$のインスタンスであるとき，\verb|(a,b)|を\verb$Enum$のインスタンスとして宣言することは可能か．
\verb||

----

たとえば，以下のようにすれば可能

\begin{code}
instance (Enum a, Enum b) => Enum (a,b) where
  fromEnum (x,y) = if ix >= iy then ix^2 + iy else (iy + 1)^2 - ix -1
    where  ix = fromEnum x
           iy = fromEnum y
  toEnum i = if i-o2 <= o'2 - i then (toEnum o,toEnum d)
             else (toEnum d',toEnum o)
    where o  = floor (sqrt (fromIntegral i))
          o2  = o    ^2
          o'2 = (o+1)^2
          d   = i   - o2
          d'  = o'2 - i - 1
\end{code}
