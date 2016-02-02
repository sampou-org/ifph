\begin{onlycompile}
\begin{code}
module Exer010407 where

import Prelude hiding (curry, uncurry)
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.7}
カリー化された関数をカリー化されてない版に変換する関数 uncurry を定義せよ．
すべての\verb|x|および\verb|y|に対して以下が成り立つことを示せ．
\verb||

\begin{spec}
curry (uncurry f) x y = f x y
uncurry (curry f) (x,y) = f (x,y)
\end{spec}

----

\verb|curry|および\verb|uncurry|の定義
\verb||

\begin{code}
curry        ::  ((a,b) -> c) -> (a -> b -> c)
curry f x y  =   f (x,y)

uncurry          ::  (a -> b -> c) -> ((a,b) -> c)
uncurry f (x,y)  =   f x y
\end{code}

\verb|curry (uncurry f) x y = f x y| の証明
\verb||

\begin{spec}
    curry (uncurry f) x y
=   { curry の定義 }
    (uncurry f) (x,y)
=   { 関数適用は左結合 }
    uncurry f (x,y)
=   { uncurry の定義 }
    f x y
\end{spec}

\verb|uncurry (curry f) (x,y) = f (x,y)|の証明
\verb||

\begin{spec}
    uncurry (curry f) (x,y)
=   { uncurry の定義 }
    (curry f) x y
=   { 関数適用は左結合 }
    curry f x y
=   { curry の定義 }
    f (x,y)
\end{spec}
