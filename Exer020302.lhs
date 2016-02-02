\begin{onlycompile}
\begin{code}
module Exer020302 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.3.2}

値が方位磁石の四方位を表すデータ型\verb|Direction|を定義し，与えられた方位の反対方向を示す方位を返す関数\verb|reverse|を定義せよ．
\verb||

----

\verb|reverse|は\verb|Prelude|で定義済みの名前なので，ここでは\verb|reverse'|を定義する．
\verb||

\begin{code}
data Direction = East | South | West | North
  deriving (Eq,Ord,Enum)

reverse' :: Direction -> Direction
reverse' d = toEnum $ (fromEnum d + 2) `div` 4
\end{code}
