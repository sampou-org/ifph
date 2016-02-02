\begin{onlycompile}
\begin{code}
{-# LANGUAGE NPlusKPatterns #-}
module Exer050104 where
import Exer050102
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.1.4}
英国通貨の金額を表す数を言葉に変換するプログラムを書け．
たとえば，数3649は thirty-six pounds and forty-nine pence に変換されるようにせよ．

----

\begin{code}
convertc  ::  Int -> String
convertc  =   combine . poundsPence

poundsPence  ::  Int -> (Int, Int)
poundsPence  =   (`divMod` 100)

combine  ::  (Int,Int) -> String
combine (0,0)      =   ""
combine (0,q+1)    =   convertPence (q+1)
combine (p+1,0)    =   convertPounds (p+1)
combine (p+1,q+1)  =   convertPounds (p+1) ++ " " ++ convertPence (q+1)


convertPence        ::  Int -> String
convertPence 1      =   "one penny"
convertPence (n+1)  =   convert (n+1) ++ " pence"

convertPounds        ::  Int -> String
convertPounds 1      =   "one pound"
convertPounds (n+1)  =   convert (n+1) ++ " pounds"
\end{code}
