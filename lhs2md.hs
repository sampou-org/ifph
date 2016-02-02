{-# LANGUAGE TupleSections #-}
module Main where

import Data.List
import System.Environment

main :: IO ()
main = do { a:_ <- getArgs
          ; cs  <- getContents
          ; putStr $ lhs2md a cs
          }

lhs2md :: String -> String -> String
lhs2md d s = concat . (heading d title:) . map head . group $ map unlines lls
  where
    ((_,title),lls) = mapAccumL procline (Normal,"") . lines $ s

heading :: String -> String -> String
heading d t = unlines ["--","title: "++t,"date: "++d,"--"]


data Flag = Ignore | Normal | Quote

procline :: (Flag,String) -> String -> ((Flag,String),[String])
procline (Ignore,t) s
  | "\\end{onlycompile}" `isPrefixOf` s = work Normal t []
  | otherwise = ignore t []
procline (Normal,t) s
  | "\\begin{code}" `isPrefixOf` s = work Quote t ["~~~~ {.haskell}"]
  | "\\begin{spec}" `isPrefixOf` s = work Quote t ["~~~~ {.spec}"]
  | "\\begin{itemize}" `isPrefixOf` s = work Normal t [""]
  | item `isPrefixOf` s = work Normal t ["- "++transline Normal (drop (length item) s)]
  | "\\end{itemize}"   `isPrefixOf` s = work Normal t [""]
  | "\\begin{samplecode}"  `isPrefixOf` s = work Quote t ["~~~~ {.sample}"]
  | "\\begin{onlycompile}" `isPrefixOf` s = ignore t []
  | titleprefix `isPrefixOf` s = case drop (length titleprefix) s of
      cs -> case break ('}'==) cs of
       (xs,_) -> work Normal xs ["### "++ xs]
  | otherwise = work Normal t [transline Normal s]
procline (Quote,t) s
  | "\\end{code}"   `isPrefixOf` s = work Normal t ["~~~~"]
  | "\\end{spec}"   `isPrefixOf` s = work Normal t ["~~~~"]
  | "\\end{samplecode}"    `isPrefixOf` s = work Normal t ["~~~~"]
  | otherwise = work Quote t [transline Quote s]

work :: Flag -> String -> a -> ((Flag,String),a)
work flg t   = ((flg,t),)
ignore :: String -> a -> ((Flag,String),a)
ignore t = ((Ignore,t),)

emph = "\\emph{"
verb = "\\verb"
item = " \\item "
titleprefix = "\\paragraph{"

transline :: Flag -> String -> String
transline _ "" = ""
transline Normal ('$':s) = case break ('$'==) s of
  (xs,_:ys) -> transline Normal xs ++ transline Normal ys
transline Normal ('_':'{':s) = case break ('}'==) s of
  (xs,_:ys) -> "<sub>"++xs++"</sub>"++transline Normal ys
transline Normal ('^':'{':s) = case break ('}'==) s of
  (xs,_:ys) -> "<sup>"++xs++"</sup>"++transline Normal ys
transline Normal s
  | emph `isPrefixOf` s = case drop (length emph) s of
      cs -> case break ('}'==) cs of
        (xs,_:ys) -> "<span style='color:red;'>"++xs++"</span>"++transline Normal ys
  | verb `isPrefixOf` s = case drop (length verb) s of
      c:cs -> case break (c==) cs of
        (xs,_:ys) -> "<pre style='display:inline;'>"++xs++"</pre>"++transline Normal ys
  | otherwise = head s: transline Normal (tail s)
transline _ s = s
