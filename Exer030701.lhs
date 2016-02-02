\begin{onlycompile}
\begin{code}
module Exer030701 where

import Prelude hiding (not,and,or)

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

zero,one,two  ::  Cnum a
zero f        =   id
one f         =   f
two f         =   f . f
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.7.1}
引数が\verb$zero$かどうかを決定する関数\verb$isZero :: Cnum a -> Cbool a$の定義を書け．
\verb||

----

\begin{code}
isZero :: Cnum a -> Cbool a
isZero cn x y = cn (true y) x
\end{code}

以下は最初に作った版．シグネチャが違う．．．orz

\begin{spec}
isZero :: Cnum (Cbool a) -> Cbool a
isZero n = n (true false) true
\end{spec}
