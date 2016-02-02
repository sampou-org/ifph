\begin{onlycompile}
\begin{code}
module Exer040206 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.6}

すべての無限リスト\verb$xs$について\verb$reverse xs = ⊥$であることを証明し，\verb$init = reverse . tail . reverse$であるとき，すべての無限リスト\verb$xs$について\verb$init xs = ⊥$であることを示せ．
\verb||

----

すべての無限リスト\verb$xs$について\verb$reverse xs = ⊥$であることの証明
\verb||

\begin{spec}
xs上の帰納法で示す．

⊥の場合

    reverse ⊥
=       { 場合の枯渇 }
    ⊥

x:xs の場合

    reverse (x:xs)
=       { reverseの定義 }
    reverse xs ++ [x]
=       { 帰納法の仮定 }
    ⊥ ++ [x]
=       { 場合の枯渇 }
    ⊥
\end{spec}

すべての無限リスト\verb$xs$について\verb$init xs = ⊥$であることの証明．

\begin{spec}
xs上の帰納法で示す．

⊥の場合

    init ⊥
=       { initの定義 }
    (reverse . tail . reverse) ⊥
=       { (.)の定義 }
    reverse (tail (reverse ⊥))
=       { 直前の証明 }
    reverse (tail ⊥)
=       { 場合の枯渇 }
    reverse ⊥
=       { 直前の証明 }
    ⊥

x:xs の場合

    init (x:xs)
=       { initの定義 }
    (reverse . tail . reverse) (x:xs)
=       { (.)の定義 }
    reverse (tail (reverse (x:xs)))
=       { 直前の証明 }
    reverse (tail ⊥)
=       { 場合の枯渇 }
    reverse ⊥
=       { 直前の証明 }
    ⊥
\end{spec}
