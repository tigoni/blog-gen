module Main where

import HTMLPrinter 

main :: IO ()
main = putStrLn  $ mkHtml "First HTML page!" "This page contains the first blog post."

