module App exposing (main)

import View
import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (id, class, value, for)
import Html.Events exposing (onClick, onInput)


main : Program Never GameState Msg
main =
    Html.program
        { init = initialModel
        , update = update
        , subscriptions = subscriptions
        , view = View.root
        }



-- UPDATE


update : Msg -> GameState -> ( GameState, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- MODEL


initialModel : ( GameState, Cmd Msg )
initialModel =
    ( { players = [ Player "Joe" 6, Player "Mario" 6, Player "Kartik" 6 ]
      , currentBid = Bid 2 2
      , currentPlayer = 0
      , cup = Nothing
      }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : GameState -> Sub Msg
subscriptions model =
    Sub.none
