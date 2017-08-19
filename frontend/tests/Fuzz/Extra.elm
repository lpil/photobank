module Fuzz.Extra exposing (..)

import Fuzz exposing (..)


nonEmptyString : Fuzzer String
nonEmptyString =
    conditional
        { retries = 10
        , fallback = \x -> x ++ " "
        , condition = \x -> x /= ""
        }
        string
