module Data.Feed exposing (Feed, decoder)

import Json.Decode exposing (Decoder, at, list, string, maybe)
import Json.Decode.Pipeline exposing (decode, custom)
import Data.Post as Post exposing (Post)


type alias Feed =
    { items : List Post
    }


decoder : Decoder Feed
decoder =
    decode Feed
        |> custom (at [ "data", "items" ] (list Post.decoder))
