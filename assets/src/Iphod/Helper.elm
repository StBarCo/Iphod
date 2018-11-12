module Iphod.Helper exposing (..) -- where

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (contains, toLower)
-- import Html.Events exposing (onWithOptions)
-- import Json.Decode as Json


-- onClickLimited: a -> Attribute
-- onClickLimited msg =
--   onWithOptions "click" { stopPropagation = True, preventDefault = True } Json.value (\_ -> Signal.message msg)

hideableClass: Bool -> String -> Attribute msg
hideableClass show attr =
  if show then class attr else class "hideable"

containsCaseInsensitive : String -> String -> Bool
containsCaseInsensitive subs s =
  contains (toLower subs) (toLower s)
