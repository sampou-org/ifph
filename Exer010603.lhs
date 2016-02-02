\begin{onlycompile}
\begin{code}
module Exer010603 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.6.3}

以下の関数\verb|strange|および\verb|stranger|に対して多相型を割り当てられるか．
\verb||

\begin{spec}
strange  f g = g (f g)
stranger f   = f f
\end{spec}

----

\verb|strange|の型
\verb||

\begin{itemize}
 \item \verb|strange| の定義より\verb|f|と\verb|g|は関数である
 \item \verb|f :: a -> b|と\verb|g :: c -> d|を仮定する
 \item 直前の仮定より\verb|strange :: (a -> b) -> (c -> d) -> d|である
 \item \verb|f g|がきちんと定義された型をもつなら$a = c -> d$
 \item したがって，\verb|f :: (c -> d) -> b|，\verb|g :: c -> d|，\verb|f g :: b|，\verb|strange :: ((c -> d) -> b) -> (c -> d) -> d|である．
 \item \verb|g (f g)|がきちんと定義された型をもつなら，\verb|c = b|である．
 \item したがって，\verb|f :: (c -> d) -> c|，\verb|g :: c -> d|，\verb|strange :: ((c -> d) -> c) -> (c -> d) -> d|である．
\end{itemize}

\verb|stranger|の型
\verb||

\begin{itemize}
 \item \verb|f|は型\verb|f :: a -> b|とする
 \item \verb|stranger :: (a -> b) -> c|である
 \item \verb|f f|がきちんと定義された型をもつなら\verb|c = b|かつ\verb|a = a -> b|である
 \item しかし，\verb|a = a -> b|はきちんと型付けできない
\end{itemize}

\begin{code}
strange ::  ((a -> b) -> a) -> (a -> b) -> b
strange f g = g (f g)
\end{code}
