\begin{onlycompile}
\begin{code}
module Exer040402 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 4.4.2}
逆の等式\verb$unzip . zipp = id$は成り立つか．
\verb||

----

\verb|xsys = ([],y:ys)|と仮定する．

\begin{spec}
   (unzip . zipp) xsys
=      { (.)，xsys の定義 }
   unzip (zipp ([],y:ys))
=      { zipp の定義 }
   unzip (uncurry zip ([],y:ys))
=      { uncurry の定義 }
   unzip (zip [] (y:ys))
=      { zip の定義 }
   unzip []
=      { unzip の定義 }
   pair (map fst, map snd) []
=      { pair の定義 }
   (map fst [], map snd [])
=      { map の定義 }
   ([],[])
\end{spec}

明らかに\verb|([],[]) ≠ ([],y:ys) ＝ xys|であるから，\verb$unzip . zipp = id$は成り立たない．
\verb||
