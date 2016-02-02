\begin{onlycompile}
\begin{code}
module Exer040213 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.13}

連接はリスト上の基本操作であるように見えるので，連接をプリミティブとしてデータ型を構成してみよう．
たとえば，

\begin{code}
data CatList a = Nil | Wrap a | Cat (CatList a) (CatList a)
\end{code}

とする．\verb$Nil$は\verb$[]$，\verb$Wrap x$は\verb$[x]$，\verb$Cat xs ys$は\verb$xs++ys$をそれぞれ表すためのものである．しかし，\verb$++$は結合性のある演算子なので，以下の2つの式は等しいとみなすべきである．
\verb||

\begin{spec}
Cat xs (Cat ys zs) と Cat (Cat xs ys) zs
\end{spec}

\verb$CatList$について\verb$Eq$クラスのインスタンスと\verb$Ord$クラスのインスタンスを適切に定義せよ．
\verb||

----

\begin{code}
toList :: CatList a -> [a]
toList Nil      = []
toList (Wrap x) = [x]
toList (Cat Nil ys) = toList ys
toList (Cat (Wrap x) ys) = x : toList ys
toList (Cat (Cat xs xs') ys) = toList xs ++ toList (Cat xs' ys)
\end{code}

\begin{code}
instance Eq a => Eq (CatList a) where
  xs == ys = toList xs == toList ys

instance Ord a => Ord (CatList a) where
  xs <= ys = toList xs <= toList ys
\end{code}
