module Request exposing (get, post)

import Http exposing (Request, Header, Body, Expect, Header, header)
import Json.Encode
import Json.Decode exposing (Decoder)
import Time exposing (Time)


{-| Perform a GET request to the given JSON returning endpoint.
-}
get : Decoder data -> String -> Request data
get decoder url =
    { defaultSettings
        | method = "GET"
        , url = url
        , expect = Http.expectJson decoder
    }
        |> Http.request


{-| Perform a POST request to the given JSON returning endpoint.
-}
post : Json.Encode.Value -> Decoder data -> String -> Request data
post body decoder url =
    { defaultSettings
        | method = "POST"
        , url = url
        , expect = Http.expectJson decoder
        , body = Http.jsonBody body
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
