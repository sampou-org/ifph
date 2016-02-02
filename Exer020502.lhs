\begin{onlycompile}
\begin{code}
module Exer020502 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.5.2.}

\verb|case (f,g) . plus (h,k) = case (f.h,g.k)|を証明せよ．
\verb||

----

\begin{spec}
   case (f,g) . plus (h,k)
=    { plus の定義 }
   case (f,g) . case (Left . h, Right . k)
=    { h . case (f,g) = case (h . f, h . g) であるから }
   case (case (f,g) . (Left . h), case (f,g) . (Right . k))
=    { (.)は結合的であるから }
   case ((case (f,g) . Left) . h, (case (f,g) . Right) . k)
=    { case (f,g) . Left = f かつ case (f,g) . Right = g であるから }
   case (f.h, g.k)
\end{spec}
