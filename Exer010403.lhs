\begin{onlycompile}
\begin{code}
module Exer010403 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.3}

$log_{2}$，$log_{e}$，$log_{10}$のように，数学ではさまざまな底の対数を使う．
底を引数としてとり，その底で対数を計算する関数を返す関数の正しい型を答えよ．

----

\begin{code}
logbase      ::  Float -> Float -> Float
logbase b x  =   logBase b x
\end{code}

\verb|logBase|は型クラス\verb|Floating|のメソッドとして定義されている．
\verb||