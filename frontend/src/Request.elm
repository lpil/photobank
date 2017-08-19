module Request exposing (get)

import Http exposing (Request, Header, Body, Expect)
import Json.Decode exposing (Decoder)
import Time exposing (Time)


{-| Perform a GET request to the given JSON returning URL.
-}
get : Decoder data -> String -> Request data
get decoder url =
    { defaultSettings
        | method = "GET"
        , url = url
        , expect = Http.expectJson decoder
    }
        |> Http.request


defaultSettings :
    { method : String
    , headers : List Header
    , url : String
    , body : Body
    , expect : Expect ()
    , timeout : Maybe Time
    , withCredentials : Bool
    }
defaultSettings =
    { method = "GET"
    , headers = []
    , url = ""
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Nothing
    , withCredentials = False
    }
