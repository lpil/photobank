module Data.NewPostTest exposing (..)

import Test exposing (..)
import Fuzz.Extra exposing (..)
import Expect
import Data.NewPost as NewPost exposing (NewPost)


suite : Test
suite =
    describe "Data.Feed.isValid"
        [ test "invalid with no text" <|
            \_ ->
                { text = "" }
                    |> NewPost.isValid
                    |> Expect.false "should be invalid with no text"
        , fuzz nonEmptyString "valid with text" <|
            \str ->
                { text = str }
                    |> NewPost.isValid
                    |> Expect.true "should be valid"
        ]
