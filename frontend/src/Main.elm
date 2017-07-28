module Main exposing (..)

import Html exposing (Html)


type alias Flags =
    {}


type alias Model =
    {}


type Msg
    = Noop


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


view : Model -> Html Msg
view view =
    Html.text "Hello, world!"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []


init : Flags -> ( Model, Cmd Msg )
init flags =
    {} ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
