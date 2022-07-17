module HTMLPrinter where


title_ String -> String
title_ pageTitle = "<title>" <> pageTitle <> "</title>"

head :: String -> String
title_ head = "<head>" <> head <> "</head>"

body_ :: String -> String 
body_ content = "<body>" <> content <> "</body>"

html_ :: String -> String
html_ body = "<html>" <> body <> "</html>"


