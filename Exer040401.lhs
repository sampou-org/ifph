\begin{onlycompile}
\begin{code}
module Exer040401 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.4.1}

\verb$unzip [⊥]$はどうなるか．
$(⊥,⊥) ≠ ⊥$であることを使って，\verb$zipp (unzip xys) ≠ xys$となるようなリスト\verb$xys$を構成せよ．
\verb||

----

\verb$unzip [⊥]$の値は，
\verb||

\begin{spec}
    unzip [⊥]
=       { unzip の定義 }
    pair (map fst, map snd) [⊥]
=       { pair の定義 }
    (map fst [⊥], map snd [⊥])
=       { map の定義 } 
    (fst ⊥ : map fst [], snd ⊥ : map snd [])
=       { fst，snd，map の定義 }
    ([⊥],[⊥])
\end{spec}

である．ここで\verb$zipp (unzip [⊥])$は
\verb||

\begin{spec}
    zipp (unzipp [⊥])
=       { 前述の運算 }
    zipp ([⊥],[⊥])
=       { zipp の定義 }
    uncurry zip ([⊥],[⊥])
=       { uncurry の定義 }
    zip (fst ([⊥],[⊥])) (snd ([⊥],[⊥]))
=       { fst，snd の定義 }
    zip [⊥] [⊥]
=       { zip の定義 }
    (⊥,⊥) : zip [] []
=       { zip の定義 }
    [(⊥,⊥)]
\end{spec}

ここで，\verb$(⊥,⊥) ≠ ⊥$であるから，\verb$[(⊥,⊥)] ≠ [⊥]$である．すなわち，\verb$xys = [⊥]$のとき，\verb$zipp (unzip xys) ≠ xys$ となる．
\verb||

