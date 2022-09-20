module  Markup where

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

