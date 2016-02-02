\begin{onlycompile}
\begin{code}
module Exer040505 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.5.5}
\verb$remdups$はリストから隣接する重複を取り除く関数である．たとえば，\verb$remdups [1,2,2,3,3,3,1,1] = [1,2,3,1]$である．\verb$remdups$を\verb$foldr$を使って定義せよ．また，\verb$foldl$を使っても定義してみよ．
\verb||

----

\begin{code}
remdup  ::  Eq a => [a] -> [a]
remdup = foldr f []
  where  f x []                    = [x]
         f x yys@(y:_) | x == y    = yys
                       | otherwise = x:yys
\end{code}

\begin{code}
remdup' :: Eq a => [a] -> [a]
remdup' = reverse . foldl g []
  where  g []        z             = [z]
         g yys@(y:_) z | y == z    = yys
                       | otherwise = z:yys
\end{code}
