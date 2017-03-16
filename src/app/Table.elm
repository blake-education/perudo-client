module Table exposing (view, init, Msg)

import Html exposing (..)


{-

   This module handles the view rendering for the table of players
   and everything relating to that.

-}


type Model
    = Model


type Msg
    = Msg


init : Model
init =
    Model


view : Model -> Html Msg
view model =
    div [] []
