\begin{onlycompile}
\begin{code}
module Exer020602 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.6.2.}

以下の宣言を考える．

\begin{code}
data Jane     = MkJane Int
newtype Dick  = MkDick Int
\end{code}

適当な関数を定義して，\verb|Jane|と\verb|Dick| が異なることを例示せよ．
\verb||

----

\verb|data|宣言と\verb|newtype|宣言の違い示す．
\verb||

\begin{code}
jane = undefined
dick = undefined

sureJane :: Jane -> Bool
sureJane (MkJane x) = True
sureDick :: Dick -> Bool
sureDick (MkDick x) = True

{-
? sureJane jane
*** Exception: Prelude.undefined
? sureDick dick
True
-}
\end{code}
