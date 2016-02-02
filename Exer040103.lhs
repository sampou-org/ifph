\begin{onlycompile}
\begin{code}
{-# LANGUAGE NoImplicitPrelude #-}
module Exer040103 where

import Prelude hiding (last)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.1.3}
空リストではないリストの最後の要素を返す関数\verb$last$の定義として以下の2つを考えよ．
\verb||

\begin{code}
last  (x:xs) = if null xs  then x else last  xs
last' (x:xs) = if xs == [] then x else last' xs
\end{code}

\verb$last$と\verb$last'$の違いは型が少し違うところである．
\verb||

\begin{code}
last  :: [a] -> a
last' :: (Eq a) => [a] -> a
\end{code}

\verb$last'$の定義には明示的に相等性検査が含まれているがゆえに，その型は相等性を持つ型から得られる要素のリストに限定される．
評価器が\verb$last e$と\verb$last' e$に対して異なる結果を応答するような式\verb$e$の例を挙げよ．
\verb||

----

たとえば，\verb|e = (take 5 (iterate ((1+) .) id))| とする．
\verb||

\begin{spec}
? let e = (take 5 (iterate ((1+) .) id))
? let f = last e
? f 0
4
? let f' = last' e

<interactive>:8:10:
    No instance for (Eq (Integer -> Integer))
      arising from a use of last'
    Possible fix:
      add an instance declaration for (Eq (Integer -> Integer))
    In the expression: last' e
    In an equation for f': f' = last' e
?
\end{spec}
