\begin{onlycompile}
\begin{code}
module Exer050203 where

import Control.Applicative
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.2.3}

4.2節で定義されている標準関数\verb$splitAt$を使って，\verb$divide$の（同一ではない）別定義を与えよ．本書における\verb$divide$の定義は対象のリストを一度しか辿らないが，別定義ではそのようになっているか．
\verb||

----

以下の定義では\verb|length|を計算するのに1度リストを辿り，\verb|splitAt|でリストを半分のところまで辿る．

\begin{code}
divide :: [a] -> ([a],[a])
divide = splitAt . (`div` 2) . length <*> id
\end{code}
