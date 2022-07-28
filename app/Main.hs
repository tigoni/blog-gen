module Main where

import HTMLPrinter 

main :: IO ()
main = putStrLn  (render html)
  
html :: Html
html = html_ "Static Blog Test" (append_ (h1_ "Heading")(append_ (p_ "paragraph #1")(p_ "paragraph #2")))
