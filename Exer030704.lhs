\begin{onlycompile}
\begin{code}

{-# LANGUAGE NPlusKPatterns #-}
module Exer030704 where

import Prelude hiding (not,and,or,succ)

type Cbool a = a -> a -> a

true,false  ::  Cbool a
true  x y   =   x
false x y   =   y

not    ::  Cbool (Cbool a) -> Cbool a
not x  =   x false true

and,or   ::  Cbool (Cbool a) -> Cbool a -> Cbool a
and x y  =   x y false
or x y   =   x true y

type Cnum a = (a -> a) -> (a -> a)

church :: Int -> Cnum Int
church = foldn succ zero

foldn :: Integral n => (a -> a) -> a -> n -> a
foldn f z 0     = z
foldn f z (n+1) = f (foldn f z n)

natural :: Cnum Int -> Int
natural cn = cn (+1) 0

zero,one,two  ::  Cnum a
zero f        =   id
one f         =   f
two f         =   f . f

succ :: Cnum a -> Cnum a
succ cn f = f . cn f

plus1 :: Cnum a -> Cnum a -> Cnum a
plus1 cn dn f = cn f . dn f

plus2 :: Cnum (Cnum a) -> Cnum a -> Cnum a
plus2 cn = cn succ

times1 :: Cnum a -> Cnum a -> Cnum a
times1  cn dn = cn . dn

times2 :: Cnum (Cnum a) -> Cnum a -> (Cnum (a -> a))
times2 cn = cn . plus1

arrow1 :: Cnum (Cnum a) -> Cnum a -> (Cnum (a -> a))
arrow1 cn = cn . times1

\end{code}
\end{onlycompile}

\paragraph{練習問題 3.7.4}
\verb|Either a b|のチャーチ版を示せ．
\verb||

----

\begin{code}
type Ceither b c a = (b -> a) -> (c -> a) -> a

left         ::  b -> Ceither b c a
left  x l _  =   l x
right        ::  c -> Ceither b c a
right y _ r  =   r y
\end{code}
