\begin{onlycompile}
\begin{code}
module Exer030203 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.2.3}
法則\verb$x↑(m+n) = (x↑m)×(x↑n)$は\emph{任意の}自然数\verb$x$，\verb$m$，\verb$n$に対して成り立つか．
\verb||

----

\verb|n|上の帰納法の場合分けに\verb|n = ⊥|の場合を追加する．
\verb||

\begin{spec}
左辺
    x ↑ (m + ⊥)
=   { + の定義．場合の枯渇 }
    x ↑ ⊥
=   { ↑の定義．場合の枯渇 }
    ⊥

右辺
    x ↑ m × x ↑ ⊥
=   { ↑の定義．場合の枯渇 }
    x ↑ m × ⊥
=   { ×の定義．場合の枯渇 }
    ⊥
\end{spec}

したがって，法則\verb$x↑(m+n) = (x↑m)×(x↑n)$は\emph{任意の}自然数\verb$x$，\verb$m$，\verb$n$に対して成り立つ．
\verb||
