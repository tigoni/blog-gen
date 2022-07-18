module HTMLPrinter where


mkHtml :: String -> String -> String
mkHtml title content = html_ $ head_ (title_ title) <> body_ content

head_ :: String -> String
head_ head = "<head>" <> head <> "</head>"

title_ :: String -> String
title_ title = "<title>" <> title <> "</title>"

--use partial application for function exprr
body_ :: String -> String 
body_ = el_ "body"

html_ :: String -> String
html_ = el_ "html"

--utility function to add specified tag to content
el_ tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
