module HTMLPrinter
  ( Html,
    Tag,
    Title,
    html_,
    p_,
    h1_,
    render,
  )
where

newtype Html = Html String

newtype Tag = Tag String

type Title = String

html_ :: Title -> Tag -> Html
html_ title content = Html (element_ "html" (element_ "head" (element_ "title" $ escape title) <> element_ "body" (getTagString content)))

-- wrap a string inside a paragraph tag `<p>str</p>`
p_ :: String -> Tag
p_ = Tag . element_ "p" . escape

-- wrap a string inside a header tag `<h1>str</h1>`
h1_ :: String -> Tag
h1_ = Tag . element_ "h1" . escape

-- ul_ :: [Tag] -> Tag
-- ul tagList = tagList

-- print/return the contents of a Tag
render :: Html -> String
render html =
  case html of
    Html str -> str

-- take a html tag and some content and wrap the content in the tag
element_ :: String -> String -> String
element_ tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

-- Get the string wrapped by a tag
getTagString :: Tag -> String
getTagString string =
  case string of
    Tag str -> str

-- handle user input that may contain invalid characters that will conflict with HTML tags

escape :: String -> String
escape =
  let escapeChar c =
        case c of
          '<' -> "&lt;"
          '>' -> "&gt;"
          '&' -> "&amp;"
          '"' -> "&quot"
          '\'' -> "&#39;"
          _ -> [c]
   in concatMap escapeChar


instance Semigroup Tag where
  (<>) elem1 elem2 = 
    Tag (getTagString elem1 <> getTagString elem2)

