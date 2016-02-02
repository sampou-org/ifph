\begin{onlycompile}
\begin{code}
module Exer030602 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.6.2}
\verb|p = (m+n) `div` 2|として，\verb|m + 1 < n|であれば\verb|m < p < n|であることを示せ．\verb|m + 1 = n|の場合はどうなるか．
\verb||

----
\verb|div|の仕様により，\verb|p = floor((m+n)/2)|．\verb|foor|の仕様により
\verb|(m+n)/2 - 1 ＜ p ≦ (m+n)/2|
\verb||

\begin{spec}
    (m+n)/2 - 1 ＜ p ≦ (m+n)/2
≡      { 全体に2をかける }
    m + n - 2 ＜ 2p ≦ m + n
≡      { m+1 ＜ n }
    2m - 1 ＜ m + n - 2 ＜ 2p ≦ m + n ＜ 2n - 1
≡      { 全体を2で割って }
    m - 1/2 ＜ p ＜ n - 1/2
≡      { 全体に 1/2 を加えて }
    m ＜ p + 1/2 ＜ n 
≡      { m,n,pともに整数だから }
    m < p < n
\end{spec}

\verb|m + 1 = n|であれば，
\verb||

\begin{spec}
    (m+n)/2 - 1 ＜ p ≦ (m+n)/2
≡      { 全体に2をかける }
    m + n - 2 ＜ 2p ≦ m + n
≡      { m+1 = n }
    2m - 1 ＜ 2p ≦ 2m + 1
≡      { 全体を2で割って }
    m - 1/2 ＜ p ≦ m + 1/2
≡      { 全体に 1/2 を加えて }
    m ＜ p + 1/2 ≦ m + 1
≡      { m,n,pともに整数だから }
    m = p ＜ n
\end{spec}

