\begin{onlycompile}
\begin{code}
module Exer040508 where

import Prelude hiding (scanr)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.8}
\verb$scanr$の効率の良いプログラムが正しいことを説明せよ．
\verb||

----

\begin{spec}
    scanr f e []
=       { scanr の仕様 }
    (map (foldr f e) . tails) []
=       { . の定義 }
    map (foldr f e) (tails [])
=       { tails の定義 }
    map (foldr f e) [[]]
=       { map の定義 }
    foldr f e [] : map (foldr f e) []
=       { map の定義 }
    foldr f e [] : []
=       { foldr の定義 }
    e : []
=       { リストのリテラル表記 }
    [e]

    scanr f e (x:xs)
=       { scanr の定義 }
    (map (foldr f e) . tails) (x:xs)
=       { . の定義 }
    map (foldr f e) (tails (x:xs))
=       { tails の定義 }
    map (foldr f e) ((x:xs) : tails xs)
=       { map の定義 }
    foldr f e (x:xs) : map (foldr f e) (tails xs)
=       { foldr の定義 }
    f x (foldr f e xs) : map (foldr f e) (tails xs)
=       { 任意の g について head (map g (tails xs)) = g xs であるから }
    f x (head (map (foldr f e) (tails xs))) : map (foldr f e) (tails xs)
=       { scanr の定義 }
    f x (head (scanr f e xs)) : scanr f e xs
=       { ys = scanr f e xs とする }
    f x (head ys) : ys
        where  ys = scanr f e xs
\end{spec}
