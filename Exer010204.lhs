\begin{onlycompile}
\begin{code}
module Exer010204 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.2.4}

直前の問題の続き．この言語にもう1つ構文規則を追加する．
（iii）$e_{1}$および$e_{2}$が式なら，$add (e_{1},e_{2})$も式である．
これに対応する簡約規則は以下のとおり．

\begin{spec}
add(zero,e2)     = e2 
add(succ(e1),e2) = succ(add(e1,e2))
add(pred(e1),e2) = pred(add(e1,e2))
\end{spec}

式 $add(succ(pred(zero)),zero)$ を単純化せよ．

この式に適用できる簡約の方法が何通りあるか数えよ．
どの方法でも同じ結果になるか．

----

\begin{spec}
(1) 外側から
    add(succ(pred(zero)),zero)
=   { add(succ(e1),e2) = succ(add(e1,e2)) }
    succ(add(pred(zero),zero))
=   { add(pred(e1),e2) = pred(add(e1,e2)) }
    succ(pred(add(zero,zero)))
=   { succ(pred(e)) = e }
    add(zero,zero)
=   { add(zero,e2) = e2 }
    zero

(2) addの簡約から
    add(succ(pred(zero)),zero)
=   { add(succ(e1),e2) = succ(add(e1,e2)) }
    succ(add(pred(zero),zero))
=   { add(pred(e1),e2) = pred(add(e1,e2)) }
    succ(pred(add(zero,zero)))
=   { add(zero,e2) = e2 }
    succ(pred(zero))
=   { succ(pred(e)) = e }
    zero

(3) 内側から
    add(succ(pred(zero)),zero)
=   { succ(pred(e)) = e }
    add(zero,zero)
=   { add(zero,e2) = e2 }
    zero
\end{spec}

簡約方法は3通り，どれも同じ結果になる．
