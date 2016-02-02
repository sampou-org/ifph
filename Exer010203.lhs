\begin{onlycompile}
\begin{code}
module Exer010203 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.2.3}

以下の構文規則で定義される整数表現の式言語を想像せよ．
（i）$zero$は式である．（ii）$e$が式なら，$succ(e)$および$pred(e)$も式である．
この言語で書かれた式は，評価器が以下の規則をこれ以上適用できなくなるまで繰り返し適用しながら簡約する．

\begin{spec}
succ (pred (e)) = e
pred (succ (e)) = e
\end{spec}

式$succ (pred (succ (pred (pred (zero)))))$を単純化せよ．

この式には何通りの方法で簡約規則を適用できるか．
それらはどれも同じ結果になるか．
どのような式を与えても簡約プロセスが必ず停止することを証明せよ．

ヒント： 式の大きさ（size）という概念を適切に定義し，各簡約ステップにおいて確実に大きさが小さくなることを示せ．

----

\begin{spec}
(1) できるだけ外側から規則を適用
    succ (pred (succ (pred (pred (zero)))))
    ^^^^^^^^^^
=   { succ (pred e) = e }
    succ (pred (pred (zero)))
    ^^^^^^^^^^
=   { succ (pred e) = e }

    pred (zero)

(2) できるだけ内側から規則を適用
    succ (pred (succ (pred (pred (zero)))))
                ^^^^^^^^^^
=   { succ (pred e) = e }
    succ (pred (pred (zero)))
    ^^^^^^^^^^
=   { succ (pred e) = e }

    pred (zero)

(3) 2つめの規則を最初に適用
    succ (pred (succ (pred (pred (zero)))))
          ^^^^^^^^^^
=   { pred (suc e) = e }
    succ (pred (pred (zero)))
    ^^^^^^^^^^
=   { succ (pred e) = e }

    pred (zero)
\end{spec}

\begin{itemize}
 \item 簡約方法は3通り
 \item すべて同じ結果になる
\end{itemize}

停止性の証明：

式の大きさsizeを以下のように定義する

\begin{spec}
size(zero)    = 1
size(succ(e)) = 1 + size(e)
size(pred(e)) = 1 + size(e)
\end{spec}

1つめの簡約規則：

\begin{spec}
左辺：size(succ(pred(e))) = 2 + size(e)
右辺：                          size(e)
\end{spec}

すなわちこの規則を適用するとサイズが2減少する．

2つめの簡約規則：

\begin{spec}
左辺：size(pred(succ(e))) = 2 + size(e)
右辺：                          size(e)
\end{spec}

すなわちこの規則を適用するとサイズが2減少する．

上述の結果により，初期式のサイズからはじまり，簡約規則適用毎に結果の式のサイズを
並べたサイズ列は厳密減少列である．
かつ，有限回の演算（$succ$および$pred$）適用できちんと構成された式のサイズの値は有限正数である．
したがって，サイズ列の長さは有限である．ゆえに，簡約プロセスは必ず停止する．
