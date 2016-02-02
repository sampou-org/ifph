\begin{onlycompile}
\begin{code}
module Exer010301 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.3.1}

multiply を以下のように定義するものとする．

\begin{code}
multiply        ::  (Integer,Integer) -> Integer
multiply (x,y)  =   if x == 0 then 0 else x * y
\end{code}

記号は2つの整数が等しいかどうかをテストするために使う．
\verb|e1 == e2|を評価するには，まず\verb|e1|と\verb|e2|を正規形にまで簡約してから，それぞれの結果が同一であるかどうかをテストすると仮定せよ．
遅延評価の下で，\verb|multiply (0,infinity)|の値はどのような値になるか，\verb|multiply (infinity,0)|の値はどうか．
\verb||

----

それぞれの式の評価は以下のように進む

\begin{spec}
    multiply (0,infinity)
=   { multiply の定義 }
    if 0 == 0 then 0 else 0 * infinity
=   { 0 == 0 = True }
    if True then 0 else 0 * infinity
=   { if の then 部 }
    0

    multiply (infinity,0)
=   { multiply の定義 }
    if infinity == 0 then 0 else infinity * 0
=   { == の左オペランドの簡約．infinityの定義 }
    if (infinity+1) == 0 then 0 else infinity * 0
=   { infinityの定義 }
    if ((infinity+1)+1) == 0 then 0 else infinity * 0
... 
=   { 停止しない }
    ⊥
\end{spec}


したがって，\verb|multiply (0,infinity)|の値は\verb|0|， \verb|multiply (infinity,0)|の値は⊥である．
\verb||
