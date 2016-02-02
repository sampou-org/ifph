\begin{onlycompile}
\begin{code}
module Exer020403 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.4.3.}

日付は整数の3つ組\verb|(d,m,y)|を使って表現されているものとせよ．ただし，\verb$d$は日，\verb$m$は月，\verb$y$は年とする．
2つの日付（1つめは現在の日付，2つめは誰か\verb$P$の生年月日）を引数としてとり，\verb$P$の満年齢を返す関数を定義せよ．
\verb||

----

\begin{code}
type Date = (Int,Int,Int)

wholeYears :: Date -> Date -> Int
wholeYears (d,m,y) (d',m',y') = y''
  where
    d'' = d - d'
    m'' = m - m' - if d'' < 0 then 1 else 0
    y'' = y - y' - if m'' < 0 then 1 else 0
\end{code}
