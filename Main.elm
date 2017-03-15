module App exposing (main)

import View
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (id, class, value, for)
import Html.Events exposing (onClick, onInput)


main : Program Never Game Msg
main =
    Html.program
        { init = initialModel
        , update = update
        , subscriptions = subscriptions
        , view = View.root
        }



-- UPDATE


update : Msg -> Game -> ( Game, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- MODEL


initialModel : ( Game, Cmd Msg )
initialModel =
    ( { gameState = Nothing, cup = Nothing, id = 1 }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Game -> Sub Msg
subscriptions model =
    Sub.none
