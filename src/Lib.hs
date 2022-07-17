module Lib  where


body_ :: String -> String 
body_ content = "<body>" <> content <> "</body>"

html_ :: String -> String
html_ body = "<html>" <> body <> "</html>"


