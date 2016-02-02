--
title: プログラミング環境
date: 2012-10-19
platform: 2012.2.0.0
--

## Haskell Platform

Haskellプログラミングの環境はHaskell Platformをインストールして使うのがよいでしょう．以下のサイトにアクセスしてPCの環境にあわせてインストールしてください．

[http://www.haskell.org/platform/](http://www.haskell.org/platform/)

## GHCiのプロンプト

GHCiのプロンプトをテキストのように「? 」にするには ghci を起動後 :set コマンドを用いてプロンプトを変更します．

~~~~
$ ghci
Prelude> :set prompt "? "
? _
~~~~

## 言語拡張指定

本書のプログラムを現在の Haskell Platform $platform に含まれる GHCi で扱うにはHaskell 98に準拠したコードを扱うことを GHCi に示す必要があります．
それに以下の4つの方法があります．

#### ghci起動時にオプションで指定

~~~~
$ ghci -XHaskell98
~~~~

#### ghciのプロンプトで指定

~~~~
Prelude> :set -XHaskell98
~~~~

#### .ghci ファイルで指定

~~~~
$ cat ~/.ghci
:set -XHaskell98
~~~~

#### LANGUAGEプラグマで指定（ソースファイルの先頭部分に書く）

~~~~ {.haskell}
{-# LANGUAGE Haskell98 #-}
module Foo where
~~~~
