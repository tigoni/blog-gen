module Lib  where


wrapHtml :: String -> String
wrapHtml content = "<html><body>" <> content <> "</body></html>"
