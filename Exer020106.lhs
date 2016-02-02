\begin{onlycompile}
\begin{code}
module Exer020106 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.6}

\verb|Triangle|を型クラス\verb|Ord|のインスタンスとして定義するにはいくつの等式が必要になるか（2.3節に同じことを実現する別の方法について説明がある）．
\verb||

----

構成子が4つあるので < を\verb|True|にするパターンは6通り．
それ以外は\verb|False|になる．したがって，7つの等式が必要．
\verb||

\begin{code}
data Triangle = Failure | Isosceles | Equilateral | Scalene

instance Eq Triangle where
  Failure     == Failure      = True
  Isosceles   == Isosceles    = True
  Equilateral == Equilateral  = True
  Scalene     == Scalene      = True
  _           == _            = False

instance Ord Triangle where
  Failure     < Isosceles   = True
  Failure     < Equilateral = True
  Failure     < Scalene     = True
  Isosceles   < Equilateral = True
  Isosceles   < Scalene     = True
  Equilateral < Scalene     = True
  _           < _           = False
\end{code}