module HTMLPrinter where


mkHtml :: String -> String -> String
mkHtml title content = html_ $ head_ (title_ title) <> body_ content

head_ :: String -> String
head_ head = "<head>" <> head <> "</head>"

title_ :: String -> String
title_ title = "<title>" <> title <> "</title>"

--use partial application for function exprr
body_ :: String -> String 
body_ = element_ "body"

html_ :: String -> String
html_ = element_ "html"

--utility function to add specified tag to content
element_ tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

--add paragraph tag
p_ :: String -> String
p_ = element_ "p"

h1_ :: String -> String
h1_ = element_ "h1"

