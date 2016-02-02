\begin{onlycompile}
\begin{code}
module Exer010205 where
\end{code}
\end{onlycompile}

\paragraph{練習問題 1.2.5}

以下の規則で式の大きさを定義するものとする．

\begin{spec}
size(zero)       = 1
size(succ(e))    = 1 + size(e)
size(pred(e))    = 1 + size(e)
size(add(e1,e2)) = 1 + 2 × (size(e1) + size(e2))
\end{spec}

先に示した5つの簡約規則のどれを適用しても式の大きさが小さくなることを示せ．
これで，どのような式から出発しても簡約プロセスが必ず停止することを証明したことになる．なぜか．

----

最初の2つは前問で示したとおり，規則が適用されるとサイズが2減る．

3つめの簡約規則：

\begin{spec}
左辺：size(add(zero,e2)) = 1 + 2×(size(zero)+size(e2)) 
                         = 3 + 2×size(e2)
右辺：size(e2)           = size(e2)
\end{spec}

すなわちこの規則を適用するとサイズが 3+size(e2) だけ減少する．

4つめの簡約規則：

\begin{spec}
左辺：size(add(succ(e1),e2)) = 1 + 2×(size(succ(e1))+size(e2)) 
                             = 3 + 2×(size(e1)+size(e2))

右辺：size(succ(add(e1,e2))) = 1 + size(add(e1,e2))
                             = 2 + 2×(size(e1)+size(e2))
\end{spec}

すなわちこの規則を適用するとサイズが 1 だけ減少する．

5つめの簡約規則：

\begin{spec}
左辺：size(add(pred(e1),e2)) = 1 + 2×(size(pred(e1))+size(e2)) 
                             = 3 + 2×(size(e1)+size(e2))

右辺：size(pred(add(e1,e2))) = 1 + size(add(e1,e2))
                             = 2 + 2×(size(e1)+size(e2))
\end{spec}

すなわちこの規則を適用するとサイズが 1 だけ減少する．

（以下は[練習問題 1.2.3](Exer010203.html)と同じ議論）
上述の結果により，初期式のサイズからはじまり，簡約規則適用毎に結果の式のサイズを
並べたサイズ列は厳密減少列である．
かつ，有限回の演算（$succ$および$pred$）適用できちんと構成された式のサイズの値は有限正数である．
したがって，サイズ列の長さは有限である．ゆえに，簡約プロセスは必ず停止する．
