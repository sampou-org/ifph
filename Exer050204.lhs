\begin{onlycompile}
\begin{code}
module Exer050204 where

type Name  =  String
type Iden  =  Integer
type Mark  =  Int
type Rank  =  Int

type Codes  =  [(Name,Iden)]
type Marks  =  [(Iden,Mark)]
type Ranks  =  [(Name,Mark,Rank)]

display   :: Ranks -> String
display   =  unlines' . (heading:) . map line

unlines' :: [String] -> String
unlines' = foldr1 join where join xs ys = xs ++ "\n" ++ ys

heading         = ljustify 12 "Name" ++ rjustify 4 "Mark" ++ rjustify 6 "Rank"
line (xn,xm,xr) = ljustify 12 xn ++ rjustify 4 (show xm) ++ rjustify 6 (show xr)

ljustify,rjustify :: Int -> String -> String
ljustify n xs = xs ++ spaces (n - length xs)
rjustify n xs = spaces (n - length xs) ++ xs

spaces :: Int -> String
spaces = flip replicate ' '

collate :: (Codes,Marks) -> [(Name,Mark)]
-- collate = sortby name . remove . zipp . cross (sortby iden, id)
--           where  name (xn,xm) = xn
--                  iden (xn,xi) = xi
collate = sortby name . zipp . cross (map fst . sortby iden, map snd)
          where  name (xn,xm) = xn
                 iden (xn,xi) = xi

remove :: [((a,b),(b,c))] -> [(a,c)]
remove =  map (cross (fst,snd))

rank    :: [(Name,Mark)] -> Ranks
-- rank xs = map (score xs) xs

score xs (xn,xm) = (xn,xm,1+length (filter (beats xm) xs))
beats xm (yn,ym) = xm < ym

rank = sortby name . assign . reverse . sortby mark
       where  mark (xn,xm)     = xm
              name (xn,xm,xr)  = xn

assign :: [(Name,Mark)] -> Ranks
assign =  scanl1 reduce . initialise

initialise :: [(Name,Mark)] -> Ranks
initialise xs = zipWith mktriple xs [1..]
                where  mktriple (xn,xm) xr = (xn,xm,xr)

reduce (xn,xm,xr) (yn,ym,yr)
  =  if ym == xm then (yn,ym,xr) else (yn,ym,yr)

sortby :: Ord b => (a -> b) -> [a] -> [a]
-- sortby f   = foldr (insertby f) []

insertby :: Ord b => (a -> b) -> a -> [a] -> [a]
insertby f x  =   insert . span test
                  where  insert (xs,ys) = xs ++ [x] ++ ys
                         test y         = f y < f x

sortby f []        = []
sortby f [x]       = [x]
sortby f (x:y:xs)  =   mergeby f (cross (sortby f,sortby f) (divide (x:y:xs)))

divide :: [a] -> ([a],[a])
divide = foldr allocate ([],[]) where allocate x (ys,zs) = (zs,x:ys)

mergeby :: Ord b => (a -> b) -> ([a],[a]) -> [a]
mergeby f ([],ys)   = ys
mergeby f (x:xs,[]) = x:xs
mergeby f (x:xs,y:ys)
  | f x <= f y = x : mergeby f (xs,y:ys)
  | otherwise  = y : mergeby f (x:xs,ys)

--

sampleCodes :: Codes
sampleCodes = [("ANDERSON",101372)
              ,("BAYLIS"  ,101369)
              ,("CARTER"  ,101370)
              ,("DENNIS"  ,101371)
              ,("EDWARDS" ,101373)]

sampleMarks :: Marks
sampleMarks = [(101369,62)
              ,(101370,75)
              ,(101371,62)
              ,(101372,30)
              ,(101373,50)]

--

zipp :: ([a],[b]) -> [(a,b)]
zipp = uncurry zip

cross :: (a -> c, b -> d) -> (a,b) -> (c,d)
cross (f,g) (x,y) = (f x,g y)
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.2.4}

等しい長さのリストの対に対しては等式

\begin{spec}
reverse . zipp = zipp . cross (reverse,reverse)
\end{spec}

が成り立つ．この事実と

\begin{spec}
reverse . map f = map f . reverse
\end{spec}

であることを使って，\verb$classlist$を書き換えよ．
\verb||

----

classlist = sortby name . assign . reverse
          . sortby mark . zipp . cross (map fst . sortby iden, map snd)

    sortby mark . zipp . cross (map fst . sortby iden, map snd)
= 
    sortby mark . reverse . zipp . cross (map fst . sortby iden, map snd)
=
    sortby mark . zipp . cross (reverse . map fst . sortby iden, reverse . map snd)
=
    sortby mark . zipp . cross (map fst . reverse . srotby iden, map snd . reverse)