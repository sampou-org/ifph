\begin{onlycompile}
\begin{code}
module Exer020301 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.3.1}

与えられた曜日の前日の曜日を返す関数\verb|dayBefore|を定義せよ．
\verb||

----

\begin{code}
data Day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
  deriving (Eq,Ord,Enum)

dayBefore :: Day -> Day
dayBefore Sun = Sat
dayBefore d   = toEnum ((fromEnum d + 6) `mod` 7)
\end{code}
