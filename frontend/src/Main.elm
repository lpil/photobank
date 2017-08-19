module Main exposing (main)

import Html exposing (Html)
import Http
import View exposing (view)
import Types exposing (Msg(..), Model)
import Update exposing (update)
import Request.Feed as Feed
import Data.NewPost as NewPost


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init flags =
    { posts = []
    , newPost = NewPost.init
    }
        ! [ Http.send RespGetFeed Feed.get
          ]


subs : Model -> Sub Msg
subs model =
    Sub.none


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subs
        }
