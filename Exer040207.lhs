\begin{onlycompile}
\begin{code}
module Exer040207 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.2.7}

\verb$reverse (reverse xs) = xs$という表明を再考しよう．
以下が成り立つので，この表明は有限のリストだけではなく，すべてのリストについて証明できているように見える．
\verb||

\begin{spec}
reverse (reverse ⊥) = reverse ⊥ = ⊥
\end{spec}

----

\verb|xs|上の帰納法により証明しようとすると，\verb|⊥|の場合および\verb|[]|の場合には成り立つが，\verb|x:xs|の場合にはなりたたない．違いは無限リストxs = ⊥と考えた点にある．
\verb||