\begin{onlycompile}
\begin{code}
module Exer010405 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.5}

以下の型を持つ関数の例を与えよ．

\begin{samplecode}
(Integer -> Integer) -> Integer
(Integer -> Integer) -> (Integer -> Integer)
\end{samplecode}

----

\begin{code}
-- | 指定して関数を1に適用する関数
applyToOne :: (Integer -> Integer) -> Integer
applyToOne = ($ 1)
-- | 指定した関数を無視して1を返す関数
ignoreOne :: (Integer -> Integer) -> Integer
ignoreOne = const 1

-- | 指定した関数を無視
applyNever :: (Integer -> Integer) -> (Integer -> Integer)
applyNever f = id
-- | 指定した関数そのもの
applyOnce :: (Integer -> Integer) -> (Integer -> Integer)
applyOnce f = f
\end{code}

