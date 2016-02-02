\begin{onlycompile}
\begin{code}
module Exer030303 where
import Prelude hiding ((/))

data Nat = Zero | Succ Nat

ominus :: Nat -> Nat -> Nat
m       `ominus` Zero    = m
Succ m  `ominus` Succ n  = m `ominus` n
_       `ominus` _       = Zero
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.3.3}

自然数の除算は，すべての正数\verb$n$，\verb$m$について\verb$(n × m) / n = m$であるという条件によって指定できる．
除算を行うプログラムを構成し，それが仕様を満たすことを証明せよ．
\verb||

----

\begin{code}
(/) :: Nat -> Nat -> Nat
Zero      / Succ _    = Zero
Succ Zero / Succ Zero = Succ Zero
m         / n         = Succ ((m `ominus` n) / n)
\end{code}

\verb|m|上の帰納法を使う
\verb||

\begin{spec}
Zero の場合
   (n × Zero) / n
=  { ×の定義 }
   Zero / n
=  { / の定義 }
   Zero

Succ m の場合
   (n × Succ m) / n
=  { / の定義 }
   Succ (((n × Succ m) `ominus` n) / n)
=  { ×の定義 }
   Succ ((((n × m) + n) `ominus` n) / n)
=  { ominus の仕様：(x + y) `ominus` y = x }
   Succ ((n × m) / n)
=  { 帰納法の仮定 }
   Succ m
\end{spec}
