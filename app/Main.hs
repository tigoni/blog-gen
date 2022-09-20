module Main where

import HTMLPrinter 
import Convert (convert)
import Markup
import System.Directory (doesFileExist)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    -- No program arguments: reading from stdin and writing to stdout
    [] -> do
      content <- getContents
      putStrLn (process "Empty title" content)

    -- With input and output file paths as program arguments
    [input, output] -> do
      content <- readFile input
      exists <- doesFileExist output
      let
        writeResult = writeFile output (process input content)
      if exists
        then whenIO confirm writeResult
        else writeResult

    -- Any other kind of program arguments
    _ ->
      putStrLn "Usage: runghc Main.hs [-- <input-file> <output-file>]"

process :: HTMLPrinter.Title -> String -> String
process title = HTMLPrinter.render . convert title . Markup.parse
