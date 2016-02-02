
\paragraph{練習問題 2.3.3}

明示的にインスタンスを与えて，\verb|Bool|を型クラス\verb|Enum|のメンバーとして宣言せよ．
\verb||

----

\begin{code}
{-# LANGUAGE NoImplicitPrelude #-}
module Exer020303 where

import GHC.Types

not :: Bool -> Bool
not False = True
not True  = False

class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x /= y = not (x == y)

class Enum a where
  toEnum :: Int -> a
  fromEnum :: a -> Int

instance Eq Bool where
  False == False = True
  True  == True  = True
  _     == _     = False

instance Enum Bool where
  fromEnum False = 0
  fromEnum True  = 1
  toEnum 0 = False
  toEnum 1 = True
\end{code}

\emph{N.B.}
\verb|Bool|は\verb|Prelude|モジュールで\verb|Enum|クラスのインスタンスとして定義されているので，\verb|Prelude|をインポートしてしまうと独自のインスタンス定義ができない．
\verb||

