\begin{onlycompile}
\begin{code}
module Exer020703 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.7.3}

日付は整数の3つ組\verb$(d,m,y)$を使って表現されているものとせよ．ただし，\verb$d$は日にち，\verb$m$は月，\verb$y$は年とする．
日付を引数としてとり，対応する日付を印字する関数\verb$showDate$を定義せよ．
使用例は以下のとおり．
\verb||

\begin{spec}
showDate (10,12,1997) は "10 December, 1997" と印字
\end{spec}

さらに複雑な版を考え，以下のようになるよう改訂せよ．

\begin{spec}
showDate (10,12,1997) は "10th December, 1997" と印字
showDate (31,12,1997) は "31st December, 1997" と印字
\end{spec}

----

\begin{code}
type Day    = Int
type Month  = Int
type Year   = Int
type Date   = (Day,Month,Year)

daysMonth      ::  Year -> Month -> Int
daysMonth y m  =   case m of
  2  -> 28 + leap y
  4  -> 30
  6  -> 30
  9  -> 30
  11 -> 30
  _  -> 31

leap :: Year -> Int
leap y | y `mod` 400 == 0 = 1
       | y `mod` 100 == 0 = 0
       | y `mod`   4 == 0 = 1
       | otherwise        = 0

monthName     ::  Month -> String
monthName  1  =   "January"
monthName  2  =   "February"
monthName  3  =   "March"
monthName  4  =   "April"
monthName  5  =   "May"
monthName  6  =   "June"
monthName  7  =   "July"
monthName  8  =   "August"
monthName  9  =   "September"
monthName 10  =   "October"
monthName 11  =   "November"
monthName 12  =   "December"
monthName m   =   error ("monthName: invalid month number "++"'"++show m++"'")

showDate :: Date -> String
showDate (d,m,y) 
  | 0 < d && d <= daysMonth y m = show d ++ " " ++ monthName m ++ ", " ++ show y
  | otherwise                   = error ("showDate: invalid date "++show (d,m,y))

showDateRevised :: Date -> String
showDateRevised (d,m,y)
  | 0 < d && d <= daysMonth y m = showDay d ++ " " ++ monthName m ++ ", " ++ show y
  | otherwise                   = error ("showDateRevised: invalid date "++show (d,m,y))

showDay :: Day -> String
showDay d = case md10 of
  1 | d /= 11 -> show d ++ "st"
  2 | d /= 12 -> show d ++ "nd"
  3 | d /= 13 -> show d ++ "rd"
  _ -> show d ++ "th"
 where
   md10 = d `mod` 10
\end{code}
