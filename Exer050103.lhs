\begin{onlycompile}
\begin{code}
{-# LANGUAGE NPlusKPatterns #-}
module Exer050103 where

convert2  ::  Int -> String
convert2  =   combine2 . digits2

digits2   ::  Int -> (Int,Int)
digits2   =   (`divMod` 10)

units,teens,tens :: [String]
units    =  ["one","two","three","four","five","six","seven","eight","nine"]
teens    =  ["ten","eleven","twelve","thirteen","fourteen"
            ,"fifteen","sixteen","seventeen","eighteen","nineteen"]
tens     =  ["twenty","thirty","forty","fifty"
            ,"sixty","seventy","eighty","ninety"]

combine2            ::  (Int,Int) -> String
combine2 (0,u+1)    =   units !! u
combine2 (1,u)      =   teens !! u
combine2 (t+2,0)    =   tens  !! t
combine2 (t+2,u+1)  =   tens !! t ++ "-" ++ units !! u


convert3  ::  Int -> String
convert3  =   combine3 . digits3

digits3   ::  Int -> (Int,Int)
digits3   =   (`divMod` 100)

combine3            ::  (Int,Int) -> String
combine3 (0,t+1)    =   convert2 (t+1)
combine3 (h+1,0)    =   units !! h ++ " hundred"
combine3 (h+1,t+1)  =   units !! h ++ " hundred and " ++ convert2 (t+1)

convert6            ::  Int -> String
convert6            =   combine6 . digits6

digits6             ::  Int -> (Int,Int)
digits6             =   (`divMod` 1000)

combine6            ::  (Int,Int) -> String
combine6 (0,h+1)    =   convert3 (h+1)
combine6 (m+1,0)    =   convert3 (m+1) ++ " thousand"
combine6 (m+1,h+1)  =   convert3 (m+1) ++ " thousand"
                    ++  link (h+1) ++ convert3 (h+1)

link                ::  Int -> String
link h              =   if h < 100 then " and " else " "

convert9   ::  Int -> String
convert9   =   combine9 . digits9

digits9    ::  Int -> (Int,Int)
digits9    =   (`divMod` 1000000)

combine9            ::  (Int,Int) -> String
combine9 (0,h+1)    =   convert6 (h+1)
combine9 (m+1,0)    =   convert3 (m+1) ++ " million"
combine9 (m+1,h+1)  =   convert3 (m+1) ++ " million"
                    ++  link (h+1) ++ convert6 (h+1)
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.1.3}
0や負の数が扱えるようにするにはどうすればよいか示せ．

----

convertで場合分けをする．

\begin{code}
convert               ::  Int -> String
convert n  | n <   0  =   "minus " ++ convert9 (negate n)
           | n ==  0  =   "zero"
           | n >   0  =   convert9 n 
\end{code}
