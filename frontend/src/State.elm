module State exposing (..)


type alias Flags =
    {}


type alias Author =
    { name : String
    , avatar : String
    }


type alias Post =
    { text : String
    , image : Maybe String
    , author : Author
    }


type alias Model =
    { posts : List Post }


type Msg
    = Noop


avatarPlaceholder : Int -> String
avatarPlaceholder n =
    "http://lorempixel.com/50/50?" ++ (toString n)


postImagePlaceholder : Int -> String
postImagePlaceholder n =
    "http://lorempixel.com/350/350?" ++ (toString n)


init : Flags -> ( Model, Cmd Msg )
init flags =
    { posts =
        [ { text = "What is imagination?…It is a God-like, a noble faculty. It renders earth tolerable; it teaches us to live, in the tone of the eternal"
          , image = Just (postImagePlaceholder 0)
          , author =
                { name = "Ada Lovelace"
                , avatar = avatarPlaceholder 0
                }
          }
        , { text = "There are only two hard things in Computer Science: cache invalidation and naming things."
          , image = Nothing
          , author =
                { name = "Phil Karlton"
                , avatar = avatarPlaceholder 1
                }
          }
        , { text = "A ship in port is safe, but that is not what ships are for. Sail out to sea and do new things"
          , image = Just (postImagePlaceholder 2)
          , author =
                { name = "Grace Hopper"
                , avatar = avatarPlaceholder 2
                }
          }
        ]
    }
        ! []


subs : Model -> Sub Msg
subs model =
    Sub.none
