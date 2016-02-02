\begin{onlycompile}
\begin{code}
{-# LANGUAGE NPlusKPatterns #-}
module Exer050105 where

import Exer050102

cross :: (a -> c, b -> d) -> (a,b) -> (c,d)
cross (f,g) = pair (f . fst, g . snd)

pair :: (a -> b, a -> c) -> a -> (b,c)
pair (f,g) x = (f x, g x)
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.1.5}
かなり難易度の高い練習問題として，\verb$convert$の逆を行うような関数を書け．
すなわち，数を英語表現で入力し，それに対応する10進表現を出力する関数を書け．
\verb||

-----

\begin{code}
rconvert  ::  String -> Int
rconvert  =   rconvert9 . noiseCancel

noiseCancel :: String -> [String]
noiseCancel = filter (/= "and") . words . map hyphen2space

hyphen2space :: Char -> Char
hyphen2space c  =   if c == '-' then ' ' else c

rconvert9  ::  [String] -> Int
rconvert9  =   ncombine9 . nums9

nums9  ::  [String] -> ([String],[String])
nums9  =   splitBy (== "million")

ncombine9  ::  ([String],[String]) -> Int
ncombine9  =   uncurry ((+) . (1000000*)) . cross (rconvert3, rconvert6)

rconvert6  ::  [String] -> Int
rconvert6  =   ncombine6 . nums6

nums6  ::  [String] -> ([String],[String])
nums6  =   splitBy (== "thousand")

ncombine6  ::  ([String],[String]) -> Int
ncombine6  =   uncurry ((+) . (1000*)) . cross (rconvert3, rconvert3)

rconvert3  ::  [String] -> Int
rconvert3  =   ncombine3 . nums3

nums3  ::  [String] -> ([String],[String])
nums3  =   splitBy (== "hundred")

ncombine3  ::  ([String],[String]) -> Int
ncombine3  =   uncurry ((+) . (100*)) . cross (rconvert2, rconvert2)

rconvert2  ::  [String] -> Int
rconvert2  =   ncombine2 . nums2

nums2  ::  [String] -> ([String],[String])
nums2  =   break (`elem` unitsTeens)

ncombine2  ::  ([String],[String]) -> Int
ncombine2  = uncurry (+) . cross (rconv', rconv'')

rconv'' :: [String] -> Int
rconv'' []    = 0
rconv'' (x:_) = search (zip unitsTeens [1 .. 19]) x

rconv'        ::  [String] -> Int
rconv' []     =   0
rconv' (x:_)  =   search (zip tens [20,30 .. 90]) x

search  ::  [(String,Int)] -> String -> Int
search [] _          =   0
search ((x,n):xs) s  =   if x == s then n else search xs s

unitsTeens  :: [String]
unitsTeens  =   (units ++ teens)

splitBy :: (a -> Bool) -> [a] -> ([a],[a])
splitBy p xs  =   case break p xs of
  (ys,[])   ->  ([],ys)
  (ys,_:zs) ->  (ys,zs)
\end{code}
