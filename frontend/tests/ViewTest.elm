module ViewTest exposing (..)

import Test exposing (..)
import View
import Html.Attributes as Attr
import Test exposing (test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, text, tag)


suite : Test
suite =
    describe "View.newPostView" <|
        [ test "form button is enabled when there is text" <|
            \_ ->
                { text = "Hello!"
                }
                    |> View.newPostView
                    |> Query.fromHtml
                    |> Query.find [ tag "button" ]
                    |> Query.has [ attribute (Attr.disabled False) ]
        , test "form button is disabled when there is no text" <|
            \_ ->
                { text = ""
                }
                    |> View.newPostView
                    |> Query.fromHtml
                    |> Query.find [ tag "button" ]
                    |> Query.has [ attribute (Attr.disabled True) ]
        ]
