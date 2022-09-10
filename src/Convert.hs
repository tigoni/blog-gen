module Convert where
    
    -- Convert Markup data types into HTMLPrinter

import qualified  Markup
import qualified HTMLPrinter

convertStructure :: Markup.Structure -> HTMLPrinter.Tag
convertStructure structure = 
    case structure of
        Markup.Heading 1 txt -> HTMLPrinter.h_ txt
        Markup.Paragraph p -> HTMLPrinter.p_ p
        Markup.UnOrderedList list -> HTMLPrinter.ul_ $ map HTMLPrinter.p_ list
        Markup.OrderedList list -> HTMLPrinter.ul_ $ map HTMLPrinter.p_ list
        Markup.CodeBlock list -> HTMLPrinter.code_ (unlines list)


