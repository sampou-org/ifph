\begin{onlycompile}
\begin{code}

{-# LANGUAGE NPlusKPatterns #-}
module Exer030702 where

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

-- zero,one,two  ::  Cnum a
zero f        =   id
one f         =   f
two f         =   f . f
three f       =   f . f . f

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

times3 cn = cn . plus2

arrow1 :: Cnum (Cnum a) -> Cnum a -> (Cnum (a -> a))
arrow1 cn = cn . times1
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.7.2}
\verb$arrow2 m n = m n$を考えたとき，なぜこれがチャーチ数の$n^{m}$であるといえるのか．\verb$arrow2$の型はどうなっているか．
\verb||

----

\verb|arrow2 cn dn|は\verb|dn|回適用する関数を\verb|cn|回適用するので，\verb|arrow2 cn dn f|は\verb|f|を$dn^{cn}$回適用する．
\verb||

\begin{code}
arrow2 :: Cnum (a -> a) -> Cnum a -> Cnum a
arrow2 cn dn = cn dn
\end{code}
