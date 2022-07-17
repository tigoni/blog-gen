module HTMLPrinter where


mkHtml :: String -> String -> String
mkHtml title content = html_ $ head_ (title_ title) <> body_ content

head_ :: String -> String
head_ head = "<head>" <> head <> "</head>"

title_ :: String -> String
title_ title = "<title>" <> title <> "</title>"

body_ :: String -> String 
body_ body = "<body>" <> body <> "</body>"

html_ :: String -> String
html_ page = "<html>" <> page <> "</html>"


