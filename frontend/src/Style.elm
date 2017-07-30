module Style exposing (Class, css)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)


type Class
    = NavBar


css =
    [ body
        [ overflowX auto
        , minWidth (px 1280)
        , backgroundColor primaryAccentColor
        ]
    , class NavBar
        [ margin zero
        , padding zero
        ]
    ]
        |> (stylesheet << namespace "dreamwriter")


primaryAccentColor =
    hex "00ffaa"
