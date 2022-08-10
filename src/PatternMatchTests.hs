module PatternMatchTests where 

import Data.Word

data Color
    = RGB Word8 Word8 Word8

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
