\begin{onlycompile}
\begin{code}
module Exer020108 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 2.1.8}

データ型上の\verb|(==)|は，以下の3つの性質を満たすことが保証されなければならない．
\verb||

\begin{itemize}
 \item **反射律：** すべての\verb|x|に対して\verb|x == x|
 \item **推移律：** \verb|x == y|かつ\verb|y == z|ならば\verb|x == z|
 \item **対称律：** \verb|x == y|ならば\verb|y == x|
\end{itemize}

きちんと定義された\verb|Bool|値の上に定義された\verb|(==)|でこれらの性質が保持されていることを示せ．
\verb||

----

\verb|Bool|が\verb|Eq|クラスのインスタンスである宣言は以下のとおり．
\verb||

\begin{spec}
instance Eq Bool where
  False == False = True
  False == True  = False
  True  == False = False
  False == False = True
\end{spec}

\begin{itemize}
 \item **反射律：** 成り立つ．\verb| False == False かつ True == True |だから．
 \item **推移律：** 成り立つ．\verb|x == y|ならば(1)\verb|x = False かつ y = False|，または，(2)\verb|x = True かつ y = True|．(1)の場合2つめの仮定より\verb|z = False|ゆえに\verb|x == z|．(2)の場合2つめの仮定より\verb|z = True|ゆえに\verb|x == z|．
 \item **対称律：** 成り立つ．\verb|x == y|ならば(1)\verb|x = False かつ y = False|，または，(2)\verb|x = True かつ y = True|．したがって，反射律より\verb|y == x|．
\end{itemize}
