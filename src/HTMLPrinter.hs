module HTMLPrinter where

newtype Tag = Tag String
newtype Html = Html String

type Title = String

html_ :: Title -> Tag -> Html 
html_ title content = Html ( element_ "html" (element_ "head" (element_ "title" title) <> element_ "body" (getTagString content)))

head_ :: String -> String
head_ headContent = "<head>" <> headContent <> "</head>"

title_ :: String -> String
title_ title = "<title>" <> title <> "</title>"


--use partial application for function exprr
body_ :: String -> String 
body_ = element_ "body"

--add paragraph tag
p_ :: String -> Tag
p_ = Tag . element_ "p"

--wrap content in header tag
h1_ :: String -> Tag 
h1_ = Tag . element_ "h1"


--utility function to add specified tag to content
element_ :: String -> String -> String
element_ tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

append_ :: Tag -> Tag -> Tag
append_ tagStr tagStr' = Tag (getTagString tagStr <> getTagString tagStr')

render :: Html -> String
render html = 
    case html of 
        Html str -> str

getTagString :: Tag -> String
getTagString string = 
    case string of 
        Tag str -> str
