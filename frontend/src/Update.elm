module Update exposing (..)

import Http
import Types exposing (..)
import Data.NewPost as NewPost
import Request.Post
import Data.Post exposing (Post)
import Data.Feed exposing (Feed)
import Data.NewPost exposing (NewPost, Field)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewPostUpdate field value ->
            pure (newPostUpdate field value model)

        NewPostSubmit ->
            effect model (newPostSubmit model)

        RespGetFeed (Ok feed) ->
            pure (respGetFeed feed model)

        RespGetFeed (Err err) ->
            Debug.crash "RespCreatePost (Err _)" err

        RespCreatePost (Ok post) ->
            pure (respCreatePost post model)

        RespCreatePost (Err err) ->
            Debug.crash "RespCreatePost (Err _)" err


{-| Send the new post data to the backend for creation.
-}
newPostSubmit : WithNewPost e -> Cmd Msg
newPostSubmit model =
    Http.send RespCreatePost (Request.Post.create model.newPost)


{-| Update a value in the new post form.
-}
newPostUpdate : Field -> String -> WithNewPost e -> WithNewPost e
newPostUpdate field value model =
    { model | newPost = NewPost.update model.newPost field value }


{-| Add the feed data to the state.
-}
respGetFeed : Feed -> WithPosts e -> WithPosts e
respGetFeed feed model =
    { model | posts = feed.items }


{-| Add the new post to posts feed and clear the form.
-}
respCreatePost : Post -> WithAllPosts e -> WithAllPosts e
respCreatePost post model =
    { model | posts = post :: model.posts, newPost = NewPost.init }


{-| Update state without dispatching any effects.
-}
pure : Model -> ( Model, Cmd Msg )
pure model =
    model ! []


{-| Dispatch an effect without altering the state.
-}
effect : Model -> Cmd Msg -> ( Model, Cmd Msg )
effect =
    (,)
