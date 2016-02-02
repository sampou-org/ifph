\begin{onlycompile}
\begin{code}
module Exer020202 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.2.2}

数字1文字を引数としてとり，それに対応する数値を返す関数\verb|digitval|を定義せよ．
\verb||

----

\begin{code}
import Data.Char

digitval :: Char -> Int
digitval d
  | isDigit d  = ord d - ord '0'
  | otherwise  = error (show d ++" is not a digit")
\end{code}

\verb|Data.Char|モジュールでは\verb|digitToInt|が定義されている．
\verb||
