module Main exposing (main)

import Html exposing (Html)
import Http
import View exposing (view)
import Update exposing (Msg(..), Model, update)
import Request.Feed as Feed


type alias Flags =
    {}


avatarPlaceholder : Int -> String
avatarPlaceholder n =
    "http://lorempixel.com/50/50?" ++ (toString n)


postImagePlaceholder : Int -> String
postImagePlaceholder n =
    "http://lorempixel.com/350/350?" ++ (toString n)


init : Flags -> ( Model, Cmd Msg )
init flags =
    { items = [] }
        ! [ Http.send RespFeed Feed.get
          ]


subs : Model -> Sub Msg
subs model =
    Sub.none


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init, view = view, update = update, subscriptions = subs }
