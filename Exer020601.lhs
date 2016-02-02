\begin{onlycompile}
\begin{code}
module Exer020601 where
\end{code}
\end{onlycompile}
\paragraph{練習問題 2.6.1.}

差が10マイル未満の距離は互いに等しいとみなしたいと仮定する．\verb$Distance$を型シノニムとして定義している場合，\verb$Distance$上の相等性検査演算を定義できるか．できるとすると，それを\verb$==$とすることはできるか．
\verb||

----

距離を表す型なら，元にする型は通常\verb|Ord|クラスおよび\verb|Num|クラスのインスタンスと宣言されているものを選ぶだろ．
\verb|Ord|クラスも\verb|Num|クラスも\verb|Eq|クラスの型に対して定義されるので，\verb|Distance|の元の型は\verb|Eq|のインスタンスでもある．
\verb|Distance|は型シノニムなので既に\verb|Eq|クラスのインスタンスとして宣言されていることになる．
新しい相等性演算子，たとえば，\verb|`distEq`|は定義できるが，Haskellにおいてはクラスインスタンスを多重定義できないので，それを\verb|==|とすることはできない．
\verb||

\begin{code}
type Distance = Double
distEq :: Distance -> Distance -> Bool
distEq d d' = abs (d - d') < 10
\end{code}