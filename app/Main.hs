module Main where

import Lib

main :: IO ()
main = putStrLn  $ html_ $ body_ "First HTML page!"

