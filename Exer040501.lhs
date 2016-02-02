\begin{onlycompile}
\begin{code}
module Exer040501 where

import Prelude hiding (filter)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.1}
\verb$filter p$を\verb$foldr$の具体例として定義せよ．
\verb||

----

\begin{code}
filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr f []
  where
    f x xs = if p x then x:xs else xs
\end{code}
