\begin{onlycompile}
\begin{code}
module Exer010601 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.6.1}

以下の関数に適切な多相型を与えよ．

\begin{samplecode}
const x y = x
subst f g x = f x (g x)
apply f x = f x
flip f x y = f y x
\end{samplecode}

----

\begin{code}
import Prelude hiding (const,flip)

const :: a -> (b -> a)
const    x    y  =  x

subst :: (a -> b -> c) -> (a -> b) -> (a -> c)
subst    f                g            x =  f x (g x)

apply :: (a -> b) -> (a -> b)
apply    f           x  =  f x

flip :: (a -> b -> c) -> (b -> a -> c)
flip    f                 x    y =  f y x
\end{code}

\emph{N.B.}
\verb|const|および\verb|flip|は\verb|Prelude|で定義されているので，これらを隠蔽するために\verb|hiding|指定して\verb|Prelude|をインポートする．
\verb||
