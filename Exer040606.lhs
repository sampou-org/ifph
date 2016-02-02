\begin{onlycompile}
\begin{code}
module Exer040606 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.6}
⊗ が ⊕ 上で分配律を満たすならば，

\begin{spec}
foldr1 (⊕) . map (x ⊗) = (x ⊗) . foldr1 (⊕)
\end{spec}

であることを証明せよ．

----

foldr1 (⊕) (map (x ⊗) (y:ys)) = (x ⊗) (foldr1 (⊕) (y:ys))
を ys 上の帰納法で示す．

\begin{spec}
[] の場合
    foldr1 (⊕) (map (x ⊗) (y:[]))
=       { map の定義 }
    foldr1 (⊕) ((x ⊗ y) : map (x ⊗) [])
=       { map の定義 }
    foldr1 (⊕) ((x ⊗ y) : [])
=       { foldr1 の定義 }
    if null [] then x ⊗ y else (x ⊗ y) ⊕ (foldr1 (⊕) [])
 =      { null [] は真だから }
    x ⊗ y
=       { foldr1 の定義 }
    x ⊗ foldr1 (⊕) (y:[])

z:zs の場合
    foldr1 (⊕) (map (x ⊗) (y:z:zs))
=       { map の定義 }
    foldr1 (⊕) ((x ⊗ y) : map (x ⊗) (z:zs))
=       { foldr1 の定義 }
    if null (map (x ⊗) (z:zs)) then (x ⊗ y)
    else (x ⊗ y) ⊕ foldr1 (⊕) (map (x ⊗) (z:zs))
=       { not (null (map (x ⊗) (z:zs))) だから }
    (x ⊗ y) ⊕ (foldr1 (⊕) (map (x ⊗) (z:zs)))
=       { 帰納法の仮定 }
    (x ⊗ y) ⊕ (x ⊗ (foldr1 (⊕) (z:zs)))
=       { 分配律 }
    x ⊗ (y ⊕ foldr1 (⊕) (z:zs))
=       { foldr1 の定義 }
    x ⊗ (foldr1 (⊕) (y:z:zs))
\end{spec}
