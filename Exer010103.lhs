\begin{onlycompile}
\begin{code}
module Exer010103 where

square :: Num a => a -> a
square x = x * x
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.1.3}

指定した半径\verb|r|を持つ円の面積を計算する関数を定義せよ（πの近似値として\verb|22/7|を使え）．
\verb||

----

\begin{code}
pi' :: Float
pi' =  22/7

area :: Float -> Float
area r = pi' * square r
\end{code}

円周率πは型クラス\verb|Floating|のメソッドのひとつ\verb|pi|として定義されている．
\verb|square|は[練習問題 1.1.1.](Exer010101.html)で定義したものを使う．
\verb||