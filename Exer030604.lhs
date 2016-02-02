\begin{onlycompile}
\begin{code}
module Exer030604 where

import Prelude hiding (sqrt)
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.6.4}
収束をテストするもう1つの方法は，連続する2つの近似値\verb$y$，\verb$y'$が十分に近いときに停止することである．
\verb||

\begin{spec}
abs (y - y') < eps * abs y
\end{spec}

\verb$sqrt$の定義を書き換えてこのテストを使うようにせよ．
実際に使う場合にはこのテストあるいは前問のテストのほうが優れている理由を説明せよ．
\verb||

----

\begin{code}
sqrt :: Double -> Double
sqrt x = until done improve x
         where  done y = abs (y - improve y) < eps * abs y
                improve y = (y+x/y)/2

eps :: Double
eps = 0.000001

\end{code}

\verb|abs (y * y - x) < eps|の場合には\verb|x|の値が小さいと根の有効桁がすくなくなり，\verb|x|が\verb|eps|より小さい数については計算できない．一方，練習問題3.6.3，3.6.4の方法であれば有効桁はほぼ一定にたもたれる．
\verb||