module Request.Feed exposing (get)

import Http
import Data.Feed as Feed exposing (Feed)
import Request


{-| Get the user's feed.
-}
get : Http.Request Feed
get =
    "http://localhost:4000/v1/feed"
        |> Request.get Feed.decoder
