\begin{onlycompile}
\begin{code}
module Exer030603 where

import Prelude hiding (sqrt)
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.6.3}
ニュートン法において，\verb$y$が十分\verb$sqrt x$に近づいたと判断するテストとして\verb$abs (y × y − x) ＜ eps$を採用した．別のテストとして，
\verb||

\begin{spec}
abs (y × y − x) ＜ eps × x
\end{spec}

がある．\verb$sqrt$関数がこちらのテストを使うように書き直せ．
\verb||

----

\begin{code}
sqrt :: Double -> Double
sqrt x = until done improve x
         where  done y = abs (y*y -x) < eps * x
                improve y = (y+x/y)/2

eps :: Double
eps = 0.000001
\end{code}