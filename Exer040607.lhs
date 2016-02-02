\begin{onlycompile}
\begin{code}
module Exer040607 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.7}
最大部分和問題の運算をもう1ステップ進めて，fold-scan融合則を使って\verb$maxlist . scanr `odot` 0$を\verb$foldl$で表したくなる．なぜこれはうまくいかないのか．（うまく機能するfold-scan融合については練習問題 4.6.10 を参照せよ．）
\verb||

----

fold-scan の融合変換は scanl （foldrのインスタンス）については可能であるが，scanr に対しては定義できない．