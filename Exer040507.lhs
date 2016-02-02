\begin{onlycompile}
\begin{code}
module Exer040507 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.7}
\verb$scanl f e [] = [e]$を証明せよ．
\verb||

----

\begin{spec}
    scanl f e []
=       { scanl の定義 }
    (map (foldl f e) . inits) []
=       { . の定義 }
    map (foldl f e) (inits [])
=       { inits の定義 }
    map (foldl f e) [[]]
=       { map の定義 }
    foldl f e [] : map (foldl f e) []
=       { map の定義 }
    foldl f e [] : []
=       { foldl の定義 }
    e : []
=       { リストのリテラル表記 }
    [e]
\end{spec}
