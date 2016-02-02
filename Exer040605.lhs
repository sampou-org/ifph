\begin{onlycompile}
\begin{code}
module Exer040605 where

import Prelude hiding (scanl)
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.6.5}
⊗が結合的で単位元 e を持つなら，scanl (⊗) e は foldr の具体例として書けることを証明せよ．
⊗ および e に何の仮定もおかずに scanl (⊗) e を foldl の具体例として書けるか．

----

scanl (⊗) e xs = foldr g [e] xs where g x xs = e:map (x ⊗) xs であることの証明
xs 上の帰納法を使う．

\begin{spec}
[] の場合
    scanl (⊗) e []
=       { scanl の定義 }
    map (foldl f e) (inits [])
=       { initsの定義 }
    map (foldl f e) [[]]
=       { map の定義 }
    foldl f e [] : map (foldl f e) []
=       { foldl の定義，map の定義 }
    e:[]
=       { リテラル表記 }
    [e]
=       { foldr の定義 }
    foldr g [e] [] where g x xs = e : map (x ⊗) xs

x:xs の場合
左辺
    scanl (⊗) e (x:xs)
=       { scanl の定義2 }
    e : scanl (⊗) (e ⊗ x) xs
=       { e は単位元 }
    e : scanl (⊗) x xs
=       { scanlの定義 }
    e : map (foldl (⊗) x) (inits xs)
右辺
    foldr g [e] (x:xs)
=       { foldr の定義}
    g x (foldr g [e] xs)
=       { 帰納法の仮定 }
    g x (scanl (⊗) e xs)
=       { g の定義 }
    e : map (x ⊗) (scanl (⊗) e xs)
=       { scanl の定義 }
    e : map (x ⊗) (map (foldl (⊗) e) (inits xs)
=       { map は関手 }
    e : map ((x ⊗) . foldl (⊗) e) (inits xs)
=       { ⊗が結合的で単位元 e を持つなら (x ⊗) . foldl (⊗) e = foldl (⊗) x }
=   e : map (foldl (⊗) x) (inits xs)
\end{spec}

 ⊗が結合的で単位元 e を持つなら (x ⊗) . foldl (⊗) e = foldl (⊗) x
の証明

\begin{spec}
⊗が結合的で単位元 e を持つなら
    x ⊗ (foldl (⊗) e xs)
=       { 第1双対定理 }
    x ⊗ (foldr (⊗) e xs)
=       { foldr の定義 }
    foldr (⊗) e (x:xs)
=       { 第1双対定理 }
    foldl (⊗) e (x:xs)
=       { foldl の定義 }
    foldl (⊗) (e ⊗ x) xs
=       { e は単位元 }
    foldl (⊗) x xs
\end{spec}

scanl を foldl のインスタンスとして定義すると

\begin{spec}
scanl (⊗) e = foldl f [e]
              where  f xs x = xs ++ [last xs ⊗ x]
\end{spec}

となるが，とくに ⊗ および e に何の仮定もおかなくてもよい．
      