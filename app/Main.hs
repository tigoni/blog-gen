module Main where

import HTMLPrinter 

main :: IO ()
main = 
  putStrLn  $ mkHtml "Static Blog Test" (h1_ "The First Blog Post" <>  p_ "This page contains the first blog post.")

