\begin{onlycompile}
\begin{code}
module Exer010404 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.4}

数学の解析学で使う（$f$の$a$から$b$までの）定積分関数に対して適切な型を与えよ．

----

\begin{code}
integral :: (Float -> Float) -> Float -> Float -> Float
integral f a b = integral' f a b (0.0001)

integral' :: (Float -> Float) -> Float -> Float -> Float -> Float
integral' f a b dx = sum $ map ((*dx) . f) $ takeWhile (<= b) $ iterate (+dx) a
\end{code}

