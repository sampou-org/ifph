\begin{onlycompile}
\begin{code}
module Exer030304 where
import Prelude hiding ((^),log,(/))

import Exer030303

halve :: Nat -> Nat
halve = (/ Succ (Succ Zero))
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.3.4}

関数\verb$log$は，すべての\verb$m$に対して，\verb$log (2^m) = m$であるという条件によって指定できる．\verb$log$のプログラムを構成し，それが仕様を満たすことを証明せよ．
\verb||

----

\begin{code}
log :: Nat -> Nat
log (Succ Zero)  = Zero
log m            = Succ (log (m / two))

two :: Nat
two =  Succ (Succ Zero)
\end{code}

\verb|m|上の帰納法を使って証明する．
\verb||

\begin{spec}
Zero の場合
   log (two ^ Zero)
=  { ^ の定義 }
   log (Succ Zero)
=  { log の定義 }
   Zero

Succ m の場合
   log (two ^ Succ m)
=  { ^ の定義 }
   log (two ^ m * two)
=  { * の交換律 }
   log (two * two ^ m)
=  { log の定義 }
   Succ (log (two * two ^ m / two))
=  { / の仕様 }
   Succ (log (two ^ m))
=  { 帰納法の仮定 }
   Succ m
\end{spec}

\verb|*| の交換律：\verb|m * n = n * m|は以下のように\verb|n|上の帰納法により証明する．
\verb||

\begin{spec}
Zero の場合
    m * Zero
=   { * の定義 }
    Zero
=   { Zero は * の左零元 }
    Zero * m

Succ Zero の場合
    m * Succ Zero
=   { Succ Zero は単位元 }
    Succ Zero * m

Succ n の場合
   m * Succ n
=  { * の定義 }
   m * n + m
=  { 帰納法の仮定 }
   n * m + m
=  { * は foldn のインスタンス，セクション }
   (+m) (foldn (+n) Zero m)
=  { 融合法則 }
   foldn (+n) m m
=  { foldn (+ Succ n) Zero m = foldn (+n) m m だから}
   foldn (+Succ n) Zero m
=  { * は foldn のインスタンス }
   Succ n * m
\end{spec}

\verb|foldn (+ Succ n) Zero m = foldn (+n) m m| の証明は\verb|m|上の帰納法による．
\verb||

\begin{spec}
Zero の場合
    foldn (+ Succ n) Zero Zero
=   { * は foldn のインスタンス }
    Succ n * Zero
=   { * の定義 }
    Zero
=   { * の定義 }
    n * Zero
=   { * は foldn のインスタンス }
    foldn (+ n) Zero Zero

Succ m の場合
    foldn (+ Succ n) Zero (Succ m)
=   { foldn の定義 }
    (+ Succ n) (foldn (+ Succ n) Zero m)
=   { 帰納法の仮定 }
    (+ Succ n) (foldn (+n) m m)
=   { (+Succ n) = Succ . (+n) かつ m = (+m) Zero }
    (Succ . (+n) . foldn (+n) ((+m) Zero)) m
=   { 融合法則 }
    (Succ . (+n) . (+m) . foldn (+n) Zero) m
=   { Succ = (+1) }
    ((+1) . (+n) . (+m) . foldn (+n) Zero) m
=   { 交換則，結合則 }
    ((+n) . (+1) . (+m) . fold (+n) Zero) m
=   { Succ = (+1) }
    ((+n) . (+ Succ m) . fold (+n) Zero) m
=   { 融合法則 }
    ((+n) . (fold (+n) ((+ Succ m) Zero))) m
=   { (.)の定義，セクション，Zero は + の単位元 }
    (+n) (foldn (+n) (Succ m) m)
=   { foldn の定義 }
    foldn (+n) (Succ m) (Succ m)
\end{spec}