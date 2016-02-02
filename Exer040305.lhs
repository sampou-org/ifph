\begin{onlycompile}
\begin{code}
module Exer040305 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.5}
\verb$inits$はリストの先頭部分リストを計算する関数であり，その型は\verb$inits :: [a] -> [[a]]$である．\verb$inits$の自然性条件はどのようなものか．
\verb||

----
\begin{spec}
map (map f) . inits = inits . map f
\end{spec}