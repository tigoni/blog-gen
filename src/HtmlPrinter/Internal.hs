--a module that provides flexibility on customisong the internal functionality of the HTMLPrinter library.
-- This module contains all the code in the HTMLPrinter module but omits the export list.

--With this setup users can still use the PAI exposed by HTMLPrinter but also other users can modify the library code to suit their needs.

module HTMLPrinter.Internal where 

newtype Html = Html String
newtype Tag = Tag String
type Title = String

html_ :: Title -> Tag -> Html 
html_ title content = Html ( element_ "html" (element_ "head" (element_ "title" $ escape title) <> element_ "body" (getTagString  content)))

--add paragraph tag
p_ :: String -> Tag
p_ = Tag . element_ "p" . escape

--wrap content in header tag
h1_ :: String -> Tag 
h1_ = Tag . element_ "h1" . escape

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


--handle user input that may contain invalid characters that will conflict with HTML tags 

escape :: String -> String
escape = 
    let 
        escapeChar c = 
            case c of 
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&quot"
                '\''-> "&#39;"
                _   -> [c]
        in 
            concatMap escapeChar
