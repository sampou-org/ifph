\begin{onlycompile}
\begin{code}
module Exer010202 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.2.2}

式\verb|square (3+4)|に対して停止する簡約系列はいくつあるか．
\verb||

----

以下の3通り．ただし，グラフ簡約や並列簡約は考慮していない．

(1)

\begin{spec}
    square (3+4)
=   { 引数を簡約 }
    square 7
=   { squareの定義 }
    7 × 7
=   { ×によるかけ算 }
    49
\end{spec}

(2)

\begin{spec}
    square (3+4)
=   { squareの定義 }
    (3+4) × (3+4)
=   { ×の左オペランドを簡約 }
    7 × (3+4)
=   { ×の右オペランドを簡約 }
    7 × 7
=   { ×によるかけ算 }
    49
\end{spec}

(3)

\begin{spec}
    square (3+4)
=   { squareの定義 }
    (3+4) × (3+4)
=   { ×の右オペランドを簡約 }
    7 × (3+4)
=   { ×の左オペランドを簡約 }
    7 × 7
=   { ×によるかけ算 }
    49
\end{spec}
