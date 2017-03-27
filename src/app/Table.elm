module Table exposing (view, init, fromPlayersAndCup)

{-|

   This module handles the table of players,
   and everything relating to that.

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (PlayerID, PlayerName)
import TableMsg exposing (Msg(..))
import Dice


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


fromPlayersAndCup : List ( Int, String, Int ) -> List Int -> Model
fromPlayersAndCup tuples cup =
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
view privateMsg { tablePlayers, myCup } =
    div []
        [ h3 [] [ text "Players" ]
        , playersView tablePlayers
        , liarButton privateMsg
        , h3 [] [ text "My Cup" ]
        , Dice.viewCup myCup
        ]


liarButton privateMsg =
    button [ onClick <| privateMsg CallLiar ] [ text "Call Liar!" ]


playersView : TablePlayers -> Html msg
playersView tablePlayers =
    div [] <|
        List.map
            playerView
            tablePlayers


playerView : TablePlayer -> Html msg
playerView { id, name, diceCount } =
    div
        [ style
            [ ( "border", "1px solid green" )
            , ( "width", "200px" )
            , ( "padding", "10px" )
            , ( "margin", "8px" )
            , ( "display", "inline-block" )
            ]
        ]
        [ div [] [ text name ]
        , div [] [ text <| Dice.describeCount diceCount ]
        ]
