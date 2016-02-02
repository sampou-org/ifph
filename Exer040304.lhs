\begin{onlycompile}
\begin{code}
module Exer040304 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.3.4}

\verb$map f (xs++ys) = map f xs ++ map f ys$を証明し，それを使って，\verb$map f . concat = concat . map (map f)$を証明せよ．
\verb||

----

\verb$map f (xs++ys) = map f xs ++ map f ys$の証明
\verb||

\begin{spec}
xs上の帰納法．

[]の場合
    map f ([]++ys)
=       { ++ の定義 }
    map f ys
=       { ++ の定義 }
    [] ++ map f ys
=       { map の定義 }
    map f [] ++ map f ys

x:xs の場合
    map f ((x:xs) ++ ys)
=       { ++ の定義 }
    map f (x:(xs ++ ys))
=       { map の定義 }
    f x : map (xs ++ ys)
=       { 帰納法の仮定 }
    f x : (map f xs ++ map f ys)
=       { ++ の定義 }
    (f x : map f xs) ++ map f ys
=       { map の定義 }
    map f (x:xs) ++ map f ys
\end{spec}

任意のxsに対して\verb$map f (concat xs) = concat (map (map f) xs)$を xs 上の帰納法を用いて証明する．
\verb||

\begin{spec}
⊥の場合
    map f (concat ⊥)
=       { concatの定義，場合の枯渇 }
    map f ⊥
=       { mapの定義，場合の枯渇 }
    ⊥
=       { concatの定義，場合の枯渇 }
    concat ⊥
=       { mapの定義，場合の枯渇 }
    concat (map (map f) ⊥)

[]の場合
    map f (concat [])
=       { concat の定義 }
    map f []
=       { map の定義 }
    []
=       { cocnat の定義 }
    concat []
=       { mapの定義 }
    concat (map (map f) [])

xs:xss の場合
    map f (concat (xs:xss))
=       { concat の定義 }
    map f (xs ++ concat xss)
=       { map f (xs++ys) = map f xs ++ map f ys だから }
    map f xs ++ map f (concat xss)
=       { 帰納法の仮定 }
    map f xs ++ concat (map (map f) xss)
=      { concat の定義 }
    concat  (map f xs : map (map f) xss)
=      { map の定義 }
    concat (map (map f) (xs:xss))
\end{spec}