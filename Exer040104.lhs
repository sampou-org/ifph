\begin{onlycompile}
\begin{code}
module Exer040104 where

import Prelude hiding (head)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.1.4}
本文のリストと双対になるリストの見方として，リストの後に要素を加えてリストを構成するというものがある．

\begin{code}
data Liste a = Nil | Snoc (Liste a) a
\end{code}

\begin{onlycompile}
\begin{code}
    deriving (Eq,Show)
\end{code}
\end{onlycompile}

\verb$Snoc$はもちろん\verb$Cons$を逆順に綴ったものである.
このようなリストの見方では，\verb$[1,2,3]$は以下のような\verb$Liste Int$の値として表現されることになる．
\verb||

\begin{spec}
Snoc (Snoc (Snoc Nil 1) 2) 3
\end{spec}

2つの見方からは全く同じ情報が得られるが，その組み立てられ方は違う．
たとえば，空ではないリストの最初の要素を返す関数\verb$head$を\verb$[a]$型に対して定義するのはやさしい．
しかし，これを\verb$Liste a$に対して定義するのは複雑である．
2つのリスト型に対して\verb$head$を定義せよ．
また，一方の型から他方の型への変換を行う関数
\verb||

\begin{code}
convert :: Liste a -> [a]
\end{code}

を定義せよ．

----

\begin{code}
sample  :: [Int]
sample  =  [1,2,3]

sample' :: Liste Int
sample' =  Snoc (Snoc (Snoc Nil 1) 2) 3

head       :: [a] -> a
head (x:_) = x
head []    = error "head applied empty"

head' :: Liste a -> a
head' (Snoc Nil x)  = x
head' (Snoc xs  _)  = head' xs
head' Nil           = error "head' applied empty"

{-
convert xs = conv [] xs
  where
    conv ys Nil = ys
    conv ys (Snoc zs z) = conv (z:ys) zs
-}

convert Nil         = []
convert (Snoc xs x) = convert xs ++ [x]

convert' :: [a] -> Liste a
convert' =  foldl Snoc Nil
\end{code}