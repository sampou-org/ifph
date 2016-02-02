\begin{onlycompile}
\begin{code}
module Exer040209 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.9}
\verb$xs ++ ys = ys ++ xs$を満たすような有限リスト\verb$xs$および$ys$の特性を述べよ．形式的記述でなくてもよい．
\verb||

----

\verb|xs = [] ∨ ys = [] ∨ xs = ys
 ∨ (∀i,j∈N . xs = concat (replicate i zs) ∧ ys = concat (replicate j zs))
