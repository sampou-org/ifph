\begin{onlycompile}
\begin{code}
module Exer020701 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.7.1}

以下の文字列を昇順に出力せよ．\verb|"McMillan"|，\verb|"Macmillan"|，\verb|"MacMillan"|．
\verb||

----

\begin{code}
import Data.List

strings  ::  (String,String,String)
strings  =   ("McMillan","Macmillan","MacMillan")

sort3 :: Ord a => (a,a,a) -> (a,a,a)
sort3 (x,y,z) 
  | x > y     = sort3 (y,x,z)
  | y > z     = sort3 (x,z,y)
  | otherwise = (x,y,z)
{-
? strings
("McMillan","Macmillan","MacMillan")
? sort3 strings
("MacMillan","Macmillan","McMillan")
-}
\end{code}
