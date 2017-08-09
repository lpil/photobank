module Main exposing (main)

import Html exposing (Html)
import View exposing (view)
import Update exposing (Msg, Model, update)


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
    let
        posts =
            [ { text = "What is imagination?…It is a God-like, a noble faculty. It renders earth tolerable; it teaches us to live, in the tone of the eternal"
              , image = Just (postImagePlaceholder 0)
              }
            , { text = "There are only two hard things in Computer Science: cache invalidation and naming things."
              , image = Nothing
              }
            , { text = "A ship in port is safe, but that is not what ships are for. Sail out to sea and do new things"
              , image = Just (postImagePlaceholder 2)
              }
            ]
    in
        { posts = posts } ! []


subs : Model -> Sub Msg
subs model =
    Sub.none


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init, view = view, update = update, subscriptions = subs }
