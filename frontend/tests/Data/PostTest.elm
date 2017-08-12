module Data.PostTest exposing (..)

import Test exposing (..)
import Expect
import Json.Decode exposing (decodeString)
import Data.Post as Post exposing (Post)


suite : Test
suite =
    describe "Data.Post.decoder"
        [ test "post without image" <|
            \_ ->
                """{"text":"Hi!"}"""
                    |> decodeString Post.decoder
                    |> Expect.equal
                        (Ok { text = "Hi!", image = Nothing })
        , test "post with image" <|
            \_ ->
                """{"text":"Hi!","image":"g.gif"}"""
                    |> decodeString Post.decoder
                    |> Expect.equal
                        (Ok { text = "Hi!", image = Just "g.gif" })
        , test "invalid" <|
            \_ ->
                """{}"""
                    |> decodeString Post.decoder
                    |> Expect.err
        ]
