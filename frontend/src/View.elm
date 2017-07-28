module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import State exposing (..)


view : Model -> Html Msg
view model =
    postFeedView model.posts


postFeedView : List Post -> Html Msg
postFeedView posts =
    ul [] <|
        List.map postView posts


postView : Post -> Html Msg
postView post =
    li []
        [ postAuthorView post
        , postContentView post
        ]


postAuthorView : Post -> Html Msg
postAuthorView post =
    div []
        [ img [ src post.author.avatar ] []
        , h3 [] [ text post.author.name ]
        ]


postContentView : Post -> Html Msg
postContentView post =
    let
        image =
            case post.image of
                Just imageSrc ->
                    [ img [ src imageSrc ] [] ]

                Nothing ->
                    []
    in
        div [] <|
            image
                ++ [ p [] [ text post.text ]
                   , hr [] []
                   ]
