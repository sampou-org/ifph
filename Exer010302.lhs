\begin{onlycompile}
\begin{code}
module Exer010302 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.3.2}

関数\verb|h|を等式\verb|h x = f (g x)|で定義したものとせよ．\verb|f|と\verb|g|がともに正格であれば，\verb|h|も正格であることを示せ．
\verb||

----

\verb|h ⊥ = ⊥|であることを以下のように示す．
\verb||

\begin{spec}
    h ⊥
=   { h の定義 }
    f (g ⊥)
=   { g は正格であるから g ⊥ = ⊥ }
    f ⊥
=   { f は正格であるから f ⊥ = ⊥ }
    ⊥
\end{spec}
