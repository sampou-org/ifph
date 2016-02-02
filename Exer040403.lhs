\begin{onlycompile}
\begin{code}
module Exer040403 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.4.3}
別の規則をいくつか仮定すると，以下の等式を関数の簡単な運算を使って証明できる．

\begin{spec}
cross (map f, map g) . unzip = unzip . map (cross (f, g))
\end{spec}

必要となる追加の規則は以下のとおり．

\begin{spec}
               map (f . g) = map f . map g
cross (f, g) . pair (h, k) = pair (f . h, g . k)
           pair (f, g) . h = pair (f . h, g . h)
        fst . cross (f, g) = f . fst
        snd . cross (f, g) = g . snd
\end{spec}

これらの規則と\verb$unzip$の定義を使って，求められる結果を証明せよ．
\verb||

----

\begin{spec}
    cross (map f, map g) . unzip
=      { unzip の定義 }
    cross (map f, map g) . pair (map fst, map snd)
=      { 2つめの規則 }
    pair (map f . map fst, map g . map snd)
=      { 1つめの規則 }
    pair (map (f . fst), map (g . snd))
=      { 4，5つめの規則 }
    pair (map (fst . cross (f,g)), map (snd . cross (f,g)))
=      { 1つめの規則 }
    pair (map fst . map (cross (f,g)),map snd . map (cross (f,g)))
=      { 3つめの規則 }
    pair (map fst, map snd) . map (cross (f,g))
=      { unzip の定義 }
    unzip . map (cross (f,g))       
\end{spec}
