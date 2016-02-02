\begin{onlycompile}
\begin{code}
module Exer040504 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.4}
関数\verb$insert$の以下ような定義を考える．
\verb||

\begin{spec}
insert x xs = takeWhile (≦ x)xs ++ [x] ++ dropWhile (≦ x) xs
\end{spec}

\verb$xs$が非減少列であるなら，すべての\verb$x$について\verb$insert x xs$も非減少列であることを示せ．\verb$insert$を使ってリストを非減少列に整列する関数\verb$isort$を定義せよ．このとき\verb$foldr$を使え．
\verb||

----

\begin{spec}
(1) ys が非減少列ならば []++ys も ys++[] も非減少列
(2) ys，zs が空ではない非減少列で，かつ last ys ≦ head zs ならば ys++zs は非減少列
(3) xs が非減少列ならば takeWhile p xs も dropWhile p xs もともに非減少列
(4) last (takeWhile (≦x) xs) ≦ x であるから (2)より xs が非減少列ならば takeWhile (≦x) xs ++ [x] も非減少列
(5) (4)，(2) xs が非減少列ならば (takeWhile (≦ x)xs ++ [x]) ++ dropWhile (≦ x) xs も非減少列
(6) したがって，xs が非減少列ならば insert x xs も非減少列である．
\end{spec}

\begin{code}
insert :: Ord a => a -> [a] -> [a]
insert x xs = takeWhile (<=x) xs ++ [x] ++ dropWhile (<=x) xs

isort :: Ord a => [a] -> [a]
isort = foldr insert []
\end{code}
