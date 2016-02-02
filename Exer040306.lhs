\begin{onlycompile}
\begin{code}
module Exer040306 where

import Prelude hiding (filter)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.6}
関数\verb$filter$は\verb$concat$と\verb$map$を使って以下のように定義できる．

\begin{spec}
filter p =  concat . map box
	    where  x = ...
\end{spec}

\verb$box$を定義せよ．
\verb||

----

\begin{code}
filter p = concat . map box
           where  box x = [ x | p x ]
\end{code}