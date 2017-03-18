module Table exposing (view, init, initWithPlayersAndCup)

{-|

   This module handles the table of players,
   and everything relating to that.

-}

import Html exposing (..)
import Html.Events exposing (..)
import Types exposing (PlayerID)
import TableMsg exposing (Msg(..))
import Dice


type alias PlayerName =
    String


type alias DiceCount =
    Int


type alias TablePlayer =
    { id : PlayerID
    , name : PlayerName
    , diceCount : DiceCount
    }


type alias TablePlayers =
    List TablePlayer


type alias Model =
    { tablePlayers : TablePlayers
    , myCup : Dice.Cup
    }


init : Model
init =
    { tablePlayers = noPlayers
    , myCup = Dice.emptyCup
    }


initWithPlayersAndCup : List ( Int, String, Int ) -> List Int -> Model
initWithPlayersAndCup tuples cup =
    let
        tupleToPlayer ( id, name, diceCount ) =
            { id = id, name = name, diceCount = diceCount }
    in
        { tablePlayers = List.map tupleToPlayer tuples
        , myCup = Dice.cupFromIntList cup
        }


noPlayers : TablePlayers
noPlayers =
    []


testPlayers : TablePlayers
testPlayers =
    [ TablePlayer 1 "Joe" 6, TablePlayer 2 "Garrett" 5 ]


view : (Msg -> msg) -> Model -> Html msg
view privateMsg { tablePlayers } =
    div []
        [ button [ onClick <| privateMsg CallLiar ] [ text "Liar!" ]
        , playersView tablePlayers
        ]


playersView : TablePlayers -> Html msg
playersView tablePlayers =
    div [] <|
        List.map
            playerView
            tablePlayers


playerView : TablePlayer -> Html msg
playerView { id, name, diceCount } =
    div []
        [ text name
        , text (toString diceCount)
        ]
