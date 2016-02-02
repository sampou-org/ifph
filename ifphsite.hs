{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Category ((>>>))
import Hakyll

main :: IO ()
main = hakyllWith config $ do
  match "css/*" $ do
    route idRoute
    compile compressCssCompiler
  match "templates/*" $ compile templateCompiler
  match (list (["index.markdown"
              ,"haskellinfo.markdown"
              ,"progenv.markdown"
              ,"errata.markdown"
              ,"comments.markdown"
              ,"TOCExer.markdown"
              ] ++ exercises)) $ do
    route $ setExtension "html"
    compile $ pageCompiler
      >>> applyTemplateCompiler "templates/default.hamlet"
      >>> relativizeUrlsCompiler

config :: HakyllConfiguration
config = defaultHakyllConfiguration { deployCommand = deploy }
  where deploy = "cp -r _site/* ." ++ " && runghc ifphsite.hs clean"

exercises = concat [exercises0101
                   ,exercises0102
                   ,exercises0103
                   ,exercises0104
                   ,exercises0105
                   ,exercises0106
                   ,exercises0107
                   ,exercises0201
                   ,exercises0202
                   ,exercises0203
                   ,exercises0204
                   ,exercises0205
                   ,exercises0206
                   ,exercises0207
                   ,exercises0301
                   ,exercises0302
                   ,exercises0303
                   ,exercises0304
                   ,exercises0305
                   ,exercises0306
                   ,exercises0307
                   ,exercises0401
                   ,exercises0402
                   ,exercises0403
                   ,exercises0404
                   ,exercises0405
                   ,exercises0406
                   ,exercises0501
                   ,exercises0502
                   ]

exercises0502 = ["Exer050201.markdown"
                ,"Exer050202.markdown"
                ,"Exer050203.markdown"
                ,"Exer050204.markdown"
                ,"Exer050205.markdown"
                ,"Exer050206.markdown"
                ]
exercises0501 = ["Exer050101.markdown"
                ,"Exer050102.markdown"
                ,"Exer050103.markdown"
                ,"Exer050104.markdown"
                ,"Exer050105.markdown"
                ]
exercises0406 = ["Exer040601.markdown"
                ,"Exer040602.markdown"
                ,"Exer040603.markdown"
                ,"Exer040604.markdown"
                ,"Exer040605.markdown"
                ,"Exer040606.markdown"
                ,"Exer040607.markdown"
                ,"Exer040608.markdown"
                ,"Exer040609.markdown"
                ,"Exer040610.markdown"
                ]
exercises0405 = ["Exer040501.markdown"
                ,"Exer040502.markdown"
                ,"Exer040503.markdown"
                ,"Exer040504.markdown"
                ,"Exer040505.markdown"
                ,"Exer040506.markdown"
                ,"Exer040507.markdown"
                ,"Exer040508.markdown"
                ,"Exer040509.markdown"
                ,"Exer040510.markdown"
                ,"Exer040511.markdown"
                ,"Exer040512.markdown"
                ]
exercises0404 = ["Exer040401.markdown"
                ,"Exer040402.markdown"
                ,"Exer040403.markdown"
                ]
exercises0403 = ["Exer040301.markdown"
                ,"Exer040302.markdown"
                ,"Exer040303.markdown"
                ,"Exer040304.markdown"
                ,"Exer040305.markdown"
                ,"Exer040306.markdown"
                ,"Exer040307.markdown"
                ,"Exer040308.markdown"
                ,"Exer040309.markdown"
                ,"Exer040310.markdown"
                ,"Exer040311.markdown"
                ]
exercises0402 = ["Exer040201.markdown"
                ,"Exer040202.markdown"
                ,"Exer040203.markdown"
                ,"Exer040204.markdown"
                ,"Exer040205.markdown"
                ,"Exer040206.markdown"
                ,"Exer040207.markdown"
                ,"Exer040208.markdown"
                ,"Exer040209.markdown"
                ,"Exer040210.markdown"
                ,"Exer040211.markdown"
                ,"Exer040212.markdown"
                ,"Exer040213.markdown"
                ]
exercises0401 = ["Exer040101.markdown"
                ,"Exer040102.markdown"
                ,"Exer040103.markdown"
                ,"Exer040104.markdown"
                ]
exercises0307 = ["Exer030701.markdown"
                ,"Exer030702.markdown"
                ,"Exer030703.markdown"
                ,"Exer030704.markdown"
                ]
exercises0306 = ["Exer030601.markdown"
                ,"Exer030602.markdown"
                ,"Exer030603.markdown"
                ,"Exer030604.markdown"
                ]
exercises0305 = ["Exer030501.markdown"
                ,"Exer030502.markdown"
                ]
exercises0304 = ["Exer030401.markdown"
                ,"Exer030402.markdown"
                ,"Exer030403.markdown"
                ]
exercises0303 = ["Exer030301.markdown"
                ,"Exer030302.markdown"
                ,"Exer030303.markdown"
                ,"Exer030304.markdown"
                ]
exercises0302 = ["Exer030201.markdown"
                ,"Exer030202.markdown"
                ,"Exer030203.markdown"
                ,"Exer030204.markdown"
                ,"Exer030205.markdown"
                ,"Exer030206.markdown"
                ,"Exer030207.markdown"
                ]
exercises0301 = ["Exer030101.markdown"
                ,"Exer030102.markdown"
                ,"Exer030103.markdown"
                ,"Exer030104.markdown"
                ,"Exer030105.markdown"
                ]
exercises0207 = ["Exer020701.markdown"
                ,"Exer020702.markdown"
                ,"Exer020703.markdown"
                ]
exercises0206 = ["Exer020601.markdown"
                ,"Exer020602.markdown"
                ]
exercises0205 = ["Exer020501.markdown"
                ,"Exer020502.markdown"
                ]
exercises0204 = ["Exer020401.markdown"
                ,"Exer020402.markdown"
                ,"Exer020403.markdown"
                ,"Exer020404.markdown"
                ]
exercises0203 = ["Exer020301.markdown"
                ,"Exer020302.markdown"
                ,"Exer020303.markdown"
                ]
exercises0202 = ["Exer020201.markdown"
                ,"Exer020202.markdown"
                ]
exercises0201 = ["Exer020101.markdown"
                ,"Exer020102.markdown"
                ,"Exer020103.markdown"
                ,"Exer020104.markdown"
                ,"Exer020105.markdown"
                ,"Exer020106.markdown"
                ,"Exer020107.markdown"
                ,"Exer020108.markdown"
                ,"Exer020109.markdown"
                ]
exercises0107 = ["Exer010701.markdown"
                ]
exercises0106 = ["Exer010601.markdown"
                ,"Exer010602.markdown"
                ,"Exer010603.markdown"
                ,"Exer010604.markdown"
                ,"Exer010605.markdown"
                ]
exercises0105 = ["Exer010501.markdown"
                ,"Exer010502.markdown"
                ]
exercises0104 = ["Exer010401.markdown"
                ,"Exer010402.markdown"
                ,"Exer010403.markdown"
                ,"Exer010404.markdown"
                ,"Exer010405.markdown"
                ,"Exer010406.markdown"
                ,"Exer010407.markdown"
                ]
exercises0103 = ["Exer010301.markdown"
                ,"Exer010302.markdown"
                ]
exercises0102 = ["Exer010201.markdown"
                ,"Exer010202.markdown"
                ,"Exer010203.markdown"
                ,"Exer010204.markdown"
                ,"Exer010205.markdown"
                ]
exercises0101 = ["Exer010101.markdown"
                ,"Exer010102.markdown"
                ,"Exer010103.markdown"
                ]
