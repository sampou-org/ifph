\begin{onlycompile}
\begin{code}
module Exer010401 where

f = undefined
g = undefined
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.4.1}

\verb|f|および\verb|g|が以下の型を持つとする．
\verb||

\begin{code}
f :: Integer -> Integer
g :: Integer -> (Integer -> Integer)
\end{code}

\verb|h|を以下のように定義してみよう．
\verb||

\begin{code}
h :: WhatType
h x y = f (g x y)
\end{code}

\verb|h|に正しい型を割り当てよ．
次に，以下の表明のうち正しいものはどれか（あるだけすべて）答えよ．
\verb||

\begin{spec}
h     = f . g
h x   = f . (g x)
h x y = (f . g) x y
\end{spec}

----

型の割り当ては以下のとおり

\begin{itemize}
 \item \verb|x|は\verb|g :: Integer -> (Integer -> Integer)|の引数であるから\verb|x :: Integer|
 \item \verb|y|は\verb|g x :: Integer -> Integer|の引数であるから\verb|y :: Integer|
 \item \verb|g x y :: Integer|であり\verb|f (g x y) :: Integer|であるから\verb|h x y :: Integer|
 \item したがって\verb|h :: Integer -> Integer -> Integer|
\end{itemize}

というわけで，

\begin{code}
type WhatType =  Integer -> Integer -> Integer
\end{code}

\verb|h|の定義から
\verb||

\begin{spec}
    h x y = f (g x y)
=   { g x y = (g x) y }
    h x y = f ((g x) y)
=   { (.) の定義 }
    h x y = (f . g x) y
=   { セクション }
    h x y = ((f .) (g x)) y
=   { 外延性の原理 }
    h x = (f .) (g x)
=   { セクション }
    h x = f . (g x)
=   { セクション }
    h x = (f .) (g x)
=   { (.) の定義 }
    h x = ((f .) . g) x
=   { 外延性の原理 }
    h = (f .) . g
\end{spec}

したがって\verb|h x = f . (g x)|は正しい表明．
\verb|h = f . g|と\verb|h x y = (f . g) x y|は外延性の原理により等価な表明であるが，型があわないのでともに正しい表明ではない．
\verb||