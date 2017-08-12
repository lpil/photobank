module Data.FeedTest exposing (..)

import Test exposing (..)
import Expect
import Json.Decode exposing (decodeString)
import Data.Feed as Feed exposing (Feed)


suite : Test
suite =
    describe "Data.Feed.decoder"
        [ test "invalid" <|
            \_ ->
                """{}"""
                    |> decodeString Feed.decoder
                    |> Expect.err
        , test "feed with posts" <|
            \_ ->
                """{
"data": {
    "items": [
        {
            "type": "post",
            "text": "Hi!",
            "image": "g.gif"
        },
        {
            "type": "post",
            "text": "Bi!"
        }
    ]
}
        }"""
                    |> decodeString Feed.decoder
                    |> Expect.equal
                        (Ok
                            { items =
                                [ { text = "Hi!", image = Just "g.gif" }
                                , { text = "Bi!", image = Nothing }
                                ]
                            }
                        )
        ]
