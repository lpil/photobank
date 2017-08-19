module Data.Feed exposing (Feed, decoder)

import Json.Decode exposing (Decoder, field, list, string, maybe)
import Json.Decode.Pipeline exposing (decode, required)
import Data.Post as Post exposing (Post)


type alias Feed =
    { items : List Post
    }


decoder : Decoder Feed
decoder =
    decode Feed
        |> required "items" (list Post.decoder)
