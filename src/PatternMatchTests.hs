module PatternMatchTests where 

import Data.Word
import Data.Maybe

data Color
    = RGB Word8 Word8 Word8
    deriving Show

getBluePart :: Color -> Word8
getBluePart col =
    case col of 
        RGB _ _ blue -> blue

data Brightness
    = Dark
    | Bright

data EightColor 
    = Black
    | Red
    | Green
    | Yellow
    | Blue
    | Magenta
    | Cyan
    | White

data AnsiColor
    = AnsiColor Brightness EightColor

ansiColorToVGA :: AnsiColor -> Color
ansiColorToVGA ansiColor = 
    case ansiColor of
        AnsiColor Dark Black -> 
            RGB 0 0 0
        AnsiColor Bright Black ->
            RGB 0 0 0
        AnsiColor Dark Red ->
            RGB 0 0 0
        AnsiColor Bright Red ->
            RGB 0 0 0
        AnsiColor _ _ ->
            RGB 255 255 255


isBright :: AnsiColor -> Bool
isBright ansiColor = 
    case ansiColor of
        AnsiColor Bright _ -> True
        AnsiColor Dark _   -> False

--uses table (https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit) for values
--TODO: correct this code to use the correct values from the table
ansiToUbuntu :: AnsiColor -> Color
ansiToUbuntu color = 
    case color of 
        AnsiColor Bright Blue ->
            RGB 0 0 255
        AnsiColor Bright Black ->
            RGB 128 128 128
        AnsiColor _ _ -> 
            RGB 0 0 0

--check empty list using listToMaybe (defined in Data.Maybe)
isEmpty :: [a] -> Bool
isEmpty list =
    case listToMaybe list of
        Just _ -> False
        Nothing -> True
