module Convert where
    
    -- Convert Markup data types into HTMLPrinter

import qualified  Markup
import qualified HTMLPrinter

convert :: HTMLPrinter.Title -> Markup.Document -> HTMLPrinter.Html
convert title = HTMLPrinter.html_ title . foldMap convertStructure

convertStructure :: Markup.Structure -> HTMLPrinter.Tag
convertStructure structure = 
    case structure of
        Markup.Heading n txt -> HTMLPrinter.h_ n txt
        Markup.Paragraph p -> HTMLPrinter.p_ p
        Markup.UnOrderedList list -> HTMLPrinter.ul_ $ map HTMLPrinter.p_ list
        Markup.OrderedList list -> HTMLPrinter.ul_ $ map HTMLPrinter.p_ list
        Markup.CodeBlock list -> HTMLPrinter.code_ (unlines list)


