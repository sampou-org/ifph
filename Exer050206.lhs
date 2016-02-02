\begin{onlycompile}
\begin{code}
module Exer050206 where

import Exer050204
\end{code}
\end{onlycompile}

\paragraph{練習問題 5.2.6}

試験が選択科目であり得点表に現れない受験者がいる可能性もある．
この問題にはどのように対応すればよいか．

----

\begin{code}

collate' :: (Codes,Marks) -> [(Name,Mark)]
collate' = uncurry zipping . cross (sortby iden, id)
  where
     iden = snd

zipping :: Codes -> Marks -> [(Name,Mark)]
zipping  _ [] = []
zipping  ((name,iden):cs) mms@((iden',mark):ms)
  | iden == iden' = (name,mark) : zipping cs ms
  | otherwise     = zipping cs mms

classlist' = rank . collate'

sampleMarks' = init sampleMarks

\end{code}