module Query.InitialPosts exposing (..)

import Json.Decode exposing (Decoder, at, list, string, maybe)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import State exposing (Post, Author)


decoder : Decoder (List Post)
decoder =
    at [ "data", "posts" ] (list post)


post : Decoder Post
post =
    decode Post
        |> required "text" string
        |> optional "image" (maybe string) Nothing
        |> required "author" author


author : Decoder Author
author =
    decode Author
        |> required "name" string
        |> required "avatar" string
