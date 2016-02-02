\begin{onlycompile}
\begin{code}
{-# LANGUAGE NoImplicitPrelude #-}
module Exer040102 where

import GHC.Types

not :: Bool -> Bool
not False = True
not True  = False

class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x /= y = not (x == y)

instance Eq a => [a] where
  []     == []     = True
  (x:xs) == (y:ys) = x == y && xs == ys
  _      == _      = False

class Eq a => Ord a where
  (<=) :: a -> a -> Bool
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.1.2}
以下のインスタンス宣言を完成せよ．

\begin{spec}
instance Ord a => Ord [a] where
  ... 
\end{spec}

第2章で具体的な型\verb$[Char]$の順序を考えたことを思い出してもらいたい．文字列の順序は辞書順である．リストに共通する\verb$ <= $の定義も辞書順である．
\verb||

----

\begin{code}
instance Ord a => Ord [a] where
  []     <= _    = True
  _      <= []   = False
  (x:xs) <= (y:ys) 
     | x == y    = xs <= ys
     | x <= y    = True
     | otherwise = False
\end{code}
