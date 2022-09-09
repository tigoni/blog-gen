module Main where

import HTMLPrinter 

main :: IO ()
main = putStrLn  (render html)
  
html :: Html
html = html_ "Static Blog Test" ((h1_ "Heading" <> p_ "paragraph #1") <> p_ "paragraph #2" <> code_ "import Prelude hiding (map)")
