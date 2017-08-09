module Update exposing (Msg(..), Model, update)

import Data.Post exposing (Post)


type Msg
    = Noop


type alias Model =
    { posts : List Post }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []
