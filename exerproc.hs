module Main where

import System.Environment
import Data.List

main :: IO ()
main = do { a:_ <- getArgs
          ; cs  <- getContents
          ; putStr $ lhs2md a cs
          }

lhs2md :: String -> String -> String
lhs2md d s = unlines . (heading d title++) . map head . group $ lls
  where
    ((title,_),lls) = mapAccumL acc ("",False) . lines $ s
    acc (hd,False) l
      | "\\begin{onlycompile}" `isPrefixOf` l = ((hd,True), "")
      | null hd && "#### " `isPrefixOf` hd'   = ((drop 5 hd',False), hd')
      | otherwise                             = ((hd,False), hd')
      where hd' = sec2hd l
    acc (hd,True) l
      | "\\end{onlycompile}" `isPrefixOf` l   = ((hd,False), "")
      | otherwise                             = ((hd,True),"")

heading :: String -> String -> [String]
heading d t = ["--","title: "++t,"date: "++d,"--"]

sec2hd :: String -> String
sec2hd l 
  | sec     `isPrefixOf` l = "#### "++ hd
  | bcode   `isPrefixOf` l = "~~~~ {.haskell}"
  | ecode   `isPrefixOf` l = "~~~~"
  | bscreen `isPrefixOf` l = "~~~~ {.shell}"
  | escreen `isPrefixOf` l = "~~~~"
  | otherwise              = l
    where 
      bcode = "\\begin{code}"
      ecode = "\\end{code}"
      bscreen = "\\begin{screen}"
      escreen = "\\end{screen}"
      sec = "\\paragraph{"
      hd = fst $ break ('}'==) (drop (length sec) l)

