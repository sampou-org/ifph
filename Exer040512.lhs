\begin{onlycompile}
\begin{code}
module Exer040512 where

import Prelude hiding (scanr1)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.12}
\verb$scanr1$に対する効率の良いプログラムを導出せよ．
\verb||

----

\begin{code}
tails1 :: [a] -> [[a]]
tails1 []  = []
tails1 [x] = [[x]]
tails1 xxs@(_:xs) = xxs : tails1 xs

scanr1 _ []     = []
scanr1 _ [x]    = [x]
scanr1 f (x:xs) = f x (head ys) : ys
                  where ys = scanr1 f xs 
\end{code}


\begin{spec}
[] の場合
     scanr1 f []
=        { scanr1 の定義 }
     (map (foldr1 f) . tails1) []
=        { . の定義 }
     map (foldr1 f) (tails1 [])
=        { tails1 の定義 }
     map (foldr1 f) []
=        { map の定義 }
     []

[x] の場合
     scanr1 f [x]
=        { scanr1 の定義 }
     (map (foldr1 f) . tails1) [x]
=        { . の定義 }
     map (foldr1 f) (tails1 [x])
=        { tails1 の定義 }
     map (foldr1 f) ([x]:[])
=        { map の定義 }
     foldr1 f [x] : map (foldr1 f) []
=        { map の定義 }
     foldr1 f [x] : []
=        { foldr1 の定義 }
     (if null [] then x else f x (foldr1 f [])) : []
=        { null [] = True だから }
     x : []
=        { リストのリテラル表記 }
     [x]

x:xs (null xs = False)の場合
     scanr1 f (x:xs)
=        { scanr1 の定義 }
     (map (foldr1 f) . tails1) (x:xs)
=        { . の定義 }
     map (foldr1 f) (tails1 (x:xs))
=        { tails1 の定義 }
     map (foldr1 f) ((x:xs):tails1 xs)
=        { map の定義 } 
     foldr1 f (x:xs) : map (foldr1 f) (tails1 xs)
=        { foldr1 の定義 }
     (if null xs then x else f x (foldr1 f xs)) : map (foldr1 f) (tails1 xs)
=        { null xs = False }
     f x (foldr1 f xs) : map (foldr1 f) (tails1 xs)
=        { 任意の g について head (map g (tails1 xs)) = g xs であるから }
     f x (head (map (foldr1 f) (tails1 xs))) : map (foldr1 f) (tails1 xs)
=        { scanr1 の定義 }
     f x (head (scanr1 f xs)) : scanr1 f xs
=        { ys = scanr1 f xs とおいて }
     f x (head ys) : ys
         where  ys = scanr1 f xs
\end{spec}
