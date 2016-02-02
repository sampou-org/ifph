\begin{onlycompile}
\begin{code}
module Exer040502 where

import Prelude hiding (takeWhile,dropWhile)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.2}
練習問題[4.3.7](Exer040307.html)で議論した\verb$takeWhile$と\verb$dropWhile$という2つの関数を考える．\verb$takeWhile$を\verb$foldr$の具体例として定義せよ．\verb$dropWhile$は畳み込み関数の具体例として定義できるか．
\verb||

----

\begin{code}
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p = foldr f []
  where
    f x xs = if p x then x:xs else []
\end{code}

\begin{code}
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p = foldl f []
  where
     f xs y | null xs && p y = []
            | otherwise      = xs ++ [y]
\end{code}

効率は悪い．