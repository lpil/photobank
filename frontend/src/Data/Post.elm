module Data.Post exposing (Post, decoder)

import Json.Decode exposing (Decoder, at, list, string, maybe)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)


type alias Post =
    { text : String
    , image : Maybe String
    }


decoder : Decoder Post
decoder =
    decode Post
        |> required "text" string
        |> optional "image" (maybe string) Nothing
