module Data.NewPost exposing (NewPost, Field(..), init, update, encode)

import Json.Encode as Encode exposing (Value)


type alias NewPost =
    { text : String
    }


type Field
    = Text


init : NewPost
init =
    { text = ""
    }


{-| Update a field in a NewPost.
-}
update : NewPost -> Field -> String -> NewPost
update post field value =
    case field of
        Text ->
            { post | text = value }


{-| Encode a NewPost into JSON suitable for posting to the backend.
-}
encode : NewPost -> Value
encode post =
    Encode.object
        [ ( "text", Encode.string post.text ) ]
