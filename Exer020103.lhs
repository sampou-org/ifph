\begin{onlycompile}
\begin{code}
module Exer020103 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.3}

型クラス\verb|Eq|の宣言を書き換えて，\verb|(/=)|のデフォルト定義を与えよ．
\verb||

----

\begin{code}
import Prelude hiding (Eq, (==),(/=))
import qualified Prelude as P (Eq, (==), (/=))

class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x /= y = not (x == y)

instance Eq Int where
  (==) = (P.==)
\end{code}
