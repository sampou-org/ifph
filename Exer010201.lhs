\begin{onlycompile}
\begin{code}
module Exer010201 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.2.1}

\verb|x×y|を評価するためには，式\verb|x|と式\verb|y|を正規形に簡約してから乗算する．
\verb|square infinity|の評価は停止するか．
\verb||

----

簡約は以下のように進む．

\begin{spec}
    square infinity
=   { squareの定義より }
    infinity × infinity
=   { 左のオペランドを簡約，infinityの定義より }
    (infinity + 1) × infinity
=   { 左のオペランドを簡約，infinityの定義より }
    ((infinity + 1) +1) × infinity
    ...
\end{spec}

\verb|×|の左オペランドを簡約するプロセスが停止しない．したがって\verb|square infinity|の評価は停止しない．
\verb||
