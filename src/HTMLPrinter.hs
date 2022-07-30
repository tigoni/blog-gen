module HTMLPrinter 
( Html
, Tag
, Title
, html_
, p_
, h1_
, append_
, render
) 
where

newtype Html = Html String
newtype Tag = Tag String
type Title = String

html_ :: Title -> Tag -> Html 
html_ title content = Html ( element_ "html" (element_ "head" (element_ "title" title) <> element_ "body" (getTagString content)))

--add paragraph tag
p_ :: String -> Tag
p_ = Tag . element_ "p"

--wrap content in header tag
h1_ :: String -> Tag 
h1_ = Tag . element_ "h1"

append_ :: Tag -> Tag -> Tag
append_ tagStr tagStr' = Tag (getTagString tagStr <> getTagString tagStr')

render :: Html -> String
render html = 
    case html of 
        Html str -> str


--internal utility functions used by this lib

element_ :: String -> String -> String
element_ tag content = 
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

getTagString :: Tag -> String
getTagString string = 
    case string of 
        Tag str -> str
