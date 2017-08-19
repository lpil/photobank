module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Types exposing (Model, Msg(..))
import Data.Post exposing (Post)
import Data.NewPost as NewPost exposing (NewPost, Field(..))


view : Model -> Html Msg
view model =
    div []
        [ navbarView
        , heroView
        , feedView model
        , footerView
        ]


navbarView : Html a
navbarView =
    nav [ class "navbar" ]
        [ div [ class "navbar-brand" ]
            [ strong [ class "navbar-item" ] [ text "Photobank" ] ]
        ]


heroView : Html a
heroView =
    section [ class "hero is-primary" ]
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ] [ text "Hello, Sailor" ]
                , h2 [ class "subtitle" ] [ text "More words go here" ]
                ]
            ]
        ]


footerView : Html a
footerView =
    section [ class "footer" ]
        [ div [ class "container" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ strong [] [ text "Photobank :)" ]
                    ]
                ]
            ]
        ]


newPostView : NewPost -> Html Msg
newPostView newPost =
    li [ class "media" ]
        [ postMediaLeft
        , Html.form [ class "media-content", onSubmit NewPostSubmit ]
            [ div [ class "field" ]
                [ p [ class "control" ]
                    [ textarea
                        [ class "textarea"
                        , value newPost.text
                        , required True
                        , onInput (NewPostUpdate Text)
                        , placeholder "Say hi!"
                        ]
                        []
                    ]
                ]
            , button
                [ disabled (not (NewPost.isValid newPost))
                , class "button is-info"
                ]
                [ text "Submit" ]
            ]
        ]


feedView : Model -> Html Msg
feedView model =
    section [ class "section" ]
        [ ul [] <|
            (newPostView model.newPost)
                :: List.map postView model.posts
        ]


postView : Post -> Html Msg
postView post =
    let
        mediaContent =
            div
                [ class "media-content" ]
                [ div [ class "content" ]
                    [ p []
                        -- TODO: Author name
                        [ strong [] [ text "Ada Lovelace" ]

                        -- TODO: Creation time
                        , small [] [ text " 31m" ]
                        , p [] [ text post.text ]
                        ]
                    ]
                , nav [ class "level is-mobile" ]
                    [ div [ class "level-left" ]
                        [ a [ class "level-item" ]
                            [ span [ class "icon is-small" ]
                                [ i [ class "fa fa-reply" ]
                                    []
                                ]
                            ]
                        , a [ class "level-item" ]
                            [ span [ class "icon is-small" ]
                                [ i [ class "fa fa-retweet" ]
                                    []
                                ]
                            ]
                        , a [ class "level-item" ]
                            [ span [ class "icon is-small" ]
                                [ i [ class "fa fa-heart" ]
                                    []
                                ]
                            ]
                        ]
                    ]
                ]
    in
        li [ class "media" ]
            [ postMediaLeft
            , mediaContent
            ]



-- TODO: Render with Author


postMediaLeft : Html a
postMediaLeft =
    figure [ class "media-left" ]
        -- TODO: Author avatar
        [ p [ class "image is-64x64" ]
            [ img [ src "http://bulma.io/images/placeholders/128x128.png" ] [] ]
        ]
