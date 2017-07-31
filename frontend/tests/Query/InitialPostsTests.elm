module Query.InitialPostsTests exposing (..)

import Test exposing (..)
import Expect
import Json.Decode exposing (decodeString)
import Query.InitialPosts exposing (..)


suite : Test
suite =
    describe "Query.InitialPosts"
        [ describe "decoder"
            [ test "no posts" <|
                \_ ->
                    """{"data":{"posts":[]}}"""
                        |> decodeString decoder
                        |> Expect.equal (Ok [])
            , test "post without image" <|
                \_ ->
                    """{"data":{"posts":[
{"text":"Hi!","author":{"name":"Sara","avatar":"1"}}
]}}"""
                        |> decodeString decoder
                        |> Expect.equal
                            (Ok
                                [ { text = "Hi!"
                                  , image = Nothing
                                  , author = { name = "Sara", avatar = "1" }
                                  }
                                ]
                            )
            , test "post with image" <|
                \_ ->
                    """{"data":{"posts":[
{"text":"Hi!","image":"g.gif","author":{"name":"Sara","avatar":"1"}}
]}}"""
                        |> decodeString decoder
                        |> Expect.equal
                            (Ok
                                [ { text = "Hi!"
                                  , image = Just "g.gif"
                                  , author = { name = "Sara", avatar = "1" }
                                  }
                                ]
                            )
            , test "invalid" <|
                \_ ->
                    """{"errors":[]}"""
                        |> decodeString decoder
                        |> Expect.err
            ]
        ]
