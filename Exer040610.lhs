\begin{onlycompile}
\begin{code}
module Exer040610 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.10}
使われている2項演算の性質に依存しない版のfold-scan融合則がある．これは以下である．

\begin{spec}
(foldl1 `oplus`) . scanl otimes e = fst . foldl odot (e,e)
\end{spec}

ここで，\verb$(x,y) `odot` z = (x `oplus` t, t)$（ただし\verb$t=y `otimes` z$）である．
この版のfold-scan融合則を証明せよ．
\verb||

----
