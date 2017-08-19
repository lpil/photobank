module Types exposing (..)

import Http
import Data.Feed exposing (Feed)
import Data.Post exposing (Post)
import Data.NewPost exposing (NewPost)
import Data.NewPost as NewPost


type Msg
    = RespCreatePost (Result Http.Error Post)
    | RespGetFeed (Result Http.Error Feed)
    | NewPostUpdate NewPost.Field String
    | NewPostSubmit


type alias Model =
    { posts : List Post
    , newPost :
        { text : String
        }
    }


type alias WithPosts e =
    { e | posts : List Post }


type alias WithNewPost e =
    { e | newPost : NewPost }


type alias WithAllPosts e =
    { e | newPost : NewPost, posts : List Post }
