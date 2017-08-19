module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Types exposing (Model, Msg(..))
import Data.Post exposing (Post)
import Data.NewPost exposing (NewPost, Field(..))


view : Model -> Html Msg
view model =
    div []
        [ newPostView model.newPost
        , feedView model.posts
        ]


newPostView : NewPost -> Html Msg
newPostView newPost =
    Html.form [ onSubmit NewPostSubmit ]
        [ input
            [ value newPost.text
            , required True
            , onInput (NewPostUpdate Text)
            ]
            []
        ]


feedView : List Post -> Html Msg
feedView posts =
    ul [] <|
        List.map postView posts


postView : Post -> Html Msg
postView post =
    li []
        [ postContentView post
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
