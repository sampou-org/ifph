\begin{onlycompile}
\begin{code}
module Exer020201 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.2.1}

アルファベット1文字を引数としてとり，アルファベット列でその文字の直後にある文字を返す関数\verb|nextlet|を定義せよ．ただし，\verb|'A'|は\verb|'Z'|の直後であると仮定せよ．
\verb||

----

ASCIIのアルファベット以外は指定した文字そのものを返すことにする．

\begin{code}
import Data.Char

nextlet :: Char -> Char
nextlet 'Z' = 'A'
nextlet 'z' = 'a'
nextlet c
  | isAscii c && isLetter c = chr (ord c  + 1)
  | otherwise               = c
\end{code}
