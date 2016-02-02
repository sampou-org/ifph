\begin{onlycompile}
\begin{code}
module Exer040302 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.2}
\verb$map f ⊥$の値はどうなるか．$map ⊥ []$の値はどうなるか．
\verb||

----

\begin{spec}
    map f ⊥
=       { 場合の枯渇 }
    ⊥  
\end{spec}

\begin{spec}
    map ⊥ []
=       { mapの定義 }
    []
\end{spec}


