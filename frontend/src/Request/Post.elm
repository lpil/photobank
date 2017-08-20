module Request.Post exposing (create)

import Http
import Data.NewPost as NewPost exposing (NewPost)
import Data.Post as Post exposing (Post)
import Request
import Json.Encode as Encode
import Json.Decode exposing (field)


{-| Create a new Post, registering it with the backend.
-}
create : NewPost -> Http.Request Post
create newPost =
    let
        json =
            Encode.object
                [ ( "post", NewPost.encode newPost ) ]
    in
        Request.post
            json
            (field "post" Post.decoder)
            "/v1/posts"
