module Update exposing (Msg(..), Model, update)

import Http
import Data.Post exposing (Post)
import Data.Feed exposing (Feed)


type Msg
    = RespFeed (Result Http.Error Feed)


type alias Model =
    { items : List Post }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RespFeed (Ok feed) ->
            feed ! []

        RespFeed (Err _) ->
            -- TODO: Handle failure
            model ! []
