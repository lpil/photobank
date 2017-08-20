module Request.Feed exposing (get)

import Http
import Json.Decode exposing (field)
import Data.Feed as Feed exposing (Feed)
import Request


{-| Get the user's feed.
-}
get : Http.Request Feed
get =
    "/v1/feed"
        |> Request.get (field "feed" Feed.decoder)
