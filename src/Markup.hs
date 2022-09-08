module Structure where

import Numeric.Natural
import Data.Maybe

type Document =
  [Structure]

data Structure
  = Heading Natural String
  | Paragraph String
  | UnOrderedList [String]
  | OrderedList [String]
  | CodeBlock [String]
  deriving (Show, Eq)

--
parse :: String -> Document
parse = parseLines Nothing . lines 

trim :: String -> String
trim = unwords . words

parseLines :: Maybe Structure -> [String] -> Document
parseLines context txts =
  case txts of
    -- done case
    [] -> maybeToList context

    -- Heading 1 case
    ('*' : ' ' : line) : rest ->
      maybe id (:) context (Heading 1 (trim line) : parseLines Nothing rest)

    -- Unordered list case
    ('-' : ' ' : line) : rest ->
      case context of
        Just (UnOrderedList list) ->
          parseLines (Just (UnOrderedList (list <> [trim line]))) rest

        _ ->
          maybe id (:) context (parseLines (Just (UnOrderedList [trim line])) rest)

    -- Ordered list case
    ('#' : ' ' : line) : rest ->
      case context of
        Just (OrderedList list) ->
          parseLines (Just (OrderedList (list <> [trim line]))) rest

        _ ->
          maybe id (:) context (parseLines (Just (OrderedList [trim line])) rest)

    -- Code block case
    ('>' : ' ' : line) : rest ->
      case context of
        Just (CodeBlock code) ->
          parseLines (Just (CodeBlock (code <> [line]))) rest

        _ ->
          maybe id (:) context (parseLines (Just (CodeBlock [line])) rest)

    -- Paragraph case
    currentLine : rest ->
      let
        line = trim currentLine
      in
        if line == ""
          then
            maybe id (:) context (parseLines Nothing rest)
          else
            case context of
              Just (Paragraph paragraph) ->
                parseLines (Just (Paragraph (unwords [paragraph, line]))) rest
              _ ->
                maybe id (:) context (parseLines (Just (Paragraph line)) rest)















-- Tests on strings

firstTest :: Document
firstTest = [Paragraph "Hello World!"]

secondTest :: Document
secondTest = [Heading 1 "Welcome", Paragraph "to this test"]

thirdTest :: Document
thirdTest = [Paragraph "Remember that multiple lines with no separation are grouped together to a single paragraph but list items remain separate.", OrderedList ["List Item 1", "List Item 2"]]

fourthTest :: Document
fourthTest =
  [ Heading 1 "Compiling Ptograms with ghc",
    Paragraph "Running ghc invokes the Glasgow Haskell Compiler (GHC), and can be used to compile Haskell modules and programs into native executables and libraries.",
    Paragraph "Create a new Haskell source file named hello.hs, and write the following code in it:",
    CodeBlock
      ["main = putStrLn \"Hello Haskell!\""],
      Paragraph
      "Now, we can compile the program by invoking ghc with the file name:",
      CodeBlock
      ["➜ ghc hello.hs", 
      "> [1 of 1] Compiling Main             ( hello.hs, hello.o )",
      "> Linking hello ..."
      ],
    Paragraph "GHC created the following files:",
    UnOrderedList
      [ "hello.hi - Haskell interface file", 
        "hello.o - Object file, the output of the compiler before linking", 
        "hello (or hello.exe on Microsoft Windows) - A native runnable executable."
      ],
      Paragraph
      "GHC will produce an executable when the source file satisfies both conditions:",
      OrderedList
      [
        "Defines the main function in the source file", 
        "Defines the module name to be Main, or does not have a module declaration"
        ],
      Paragraph
      "Otherwise, it will only produce the .o and .hi files."
  ]


--utility functions on recursion refresher
replicate' :: Int -> Int -> [Int]
replicate' x n | n <= 0  = [] 
               | otherwise = x : replicate' x (n - 1)

-- mutual recursion (even' calls odd' which then calls even' ...until N - 1 == 0)
even' :: Natural -> Bool
even' x | x == 0    = True
        | otherwise = odd' (x - 1)

odd' :: Natural -> Bool
odd' y | y == 0    = False
       | otherwise = even' (y - 1)