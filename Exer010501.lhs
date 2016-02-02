
\paragraph{練習問題 1.5.1}

フィボナッチ数$f_{0},f_{1},...$ は，$n ≧ 0$であるようなすべての$n$に対して，$f_{0} = 0, f_{1} = 1, f_{n+2} = f_{n+1} + f_{n}$という規則で定義する．
整数nをとり，$f_{n}$を返す関数\verb|fib|の定義を与えよ．
\verb||

----

\begin{code}
{-# LANGUAGE NPlusKPatterns #-}

fib :: Integer -> Integer
fib 0     = 0
fib 1     = 1
fib (n+2) = fib (n+1) + fib n
\end{code}

\emph{N.B.}
スクリプトファイル先頭の\verb|{-# LANGUAGE NPlusKPatterns #-}|は
\verb|n+k|パターンを使うための言語拡張プラグマである．
これのかわりに\verb|{-# LANGUAGE Haskell98 #-}|でもよい．
\verb||