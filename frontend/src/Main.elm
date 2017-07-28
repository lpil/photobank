module Main exposing (main)

import Html exposing (Html)
import State exposing (..)
import View exposing (view)


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init, view = view, update = update, subscriptions = subs }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []
