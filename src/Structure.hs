module Structure where

import Numeric.Natural

type Document =
  [Structure]

data Structure
  = Heading Natural String
  | Paragraph String
  | UnOrderedList [String]
  | OrderedList [String]
  | CodeBlock [String]
  deriving (Show)

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
even' :: Int -> Bool
even' x | x == 0    = True
        | otherwise = odd' (x - 1)

odd' :: Int -> Bool
odd' y | y == 0    = False
       | otherwise = even' (y - 1)
