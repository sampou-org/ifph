\begin{onlycompile}
\begin{code}
module Exer030601 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 3.6.1}
\verb$floor x$の2つめのプログラムが，2log_{2} (abs x)ステップの計算であることを説明せよ．
\verb||

----

\begin{spec}
0 ≦ x の場合：
  1ステップで上限を2倍にするので，upper の計算にlog_{2} (abs x) ステップ．
  下限と上限との区間幅を半分にするので，middle の計算にlog_{2}(abs x)ステップ．
  したがって，全体としては2 log_{2}(abs x)ステップの計算になる．

x ＜ 0 の場合：上の場合と同様の推論．
\end{spec}
