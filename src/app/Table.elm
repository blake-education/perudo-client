module Table exposing (view, emptyState, TableConfig)

{-|

   This module handles the table of players,
   and everything relating to that.

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (PlayerID, PlayerName)
import Dice
import Identicon exposing (identicon)


type alias DiceCount =
    Int


type alias TablePlayer =
    { id : PlayerID
    , name : PlayerName
    , diceCount : DiceCount
    }


type alias TableConfig msg =
    { callLiar : PlayerID -> msg
    }


type alias TablePlayers =
    List TablePlayer


type alias State =
    { tablePlayers : TablePlayers
    , myCup : Dice.Cup
    , currentPlayerId : PlayerID
    }


emptyState : State
emptyState =
    { tablePlayers = noPlayers
    , myCup = Dice.emptyCup
    , currentPlayerId = 0
    }


noPlayers : TablePlayers
noPlayers =
    []


view : TableConfig msg -> State -> Html msg
view tableConfig { tablePlayers, myCup, currentPlayerId } =
    div []
        [ h3 [] [ text "Players" ]
        , playersView tableConfig tablePlayers currentPlayerId
        , h3 [] [ text "My Cup" ]
        , Dice.viewCup myCup
        ]


playersView : TableConfig msg -> TablePlayers -> PlayerID -> Html msg
playersView tableConfig tablePlayers currentPlayerId =
    div [] <|
        List.map
            (\player -> playerView tableConfig player (currentPlayerId == player.id))
            tablePlayers


playerView : TableConfig msg -> TablePlayer -> Bool -> Html msg
playerView { callLiar } { id, name, diceCount } isCurrentPlayer =
    let
        backgroundColourOfCurrentPlayer =
            if isCurrentPlayer then
                "#0f0"
            else
                "#cfc"

        optionalLiarButtonDiv =
            if isCurrentPlayer then
                [ div [ onClick <| callLiar id ] [ liarButton name ] ]
            else
                []
    in
        div
            [ style
                [ ( "border", "5px solid #262" )
                , ( "width", "200px" )
                , ( "background-color", backgroundColourOfCurrentPlayer )
                , ( "padding", "10px" )
                , ( "margin", "8px" )
                , ( "display", "inline-block" )
                ]
            ]
            ([ div [ iconStyle ] [ identicon "50px" name ]
             , div [] [ text name ]
             , div [] [ text <| Dice.describeCount diceCount ]
             ]
                ++ optionalLiarButtonDiv
            )


liarButton name =
    button
        []
        [ text <| "Call " ++ name ++ " a Liar!" ]


iconStyle : Attribute msg
iconStyle =
    style
        [ ( "width", "50px" )
        , ( "height", "50px" )
        , ( "padding", "10px 0" )
        , ( "margin", "auto" )
        , ( "font-size", "2em" )
        , ( "text-align", "center" )
        ]
