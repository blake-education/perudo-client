module Table exposing (view, init, fromPlayerTuplesCurrentAndCup)

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
import Identicon exposing (identicon)


type alias DiceCount =
    Int


type alias TablePlayer =
    { name : PlayerName
    , diceCount : DiceCount
    }


type alias TablePlayers =
    List TablePlayer


type alias Model =
    { tablePlayers : TablePlayers
    , myCup : Dice.Cup
    , currentPlayerIndex : Int
    }


init : Model
init =
    { tablePlayers = noPlayers
    , myCup = Dice.emptyCup
    , currentPlayerIndex = 0
    }


fromPlayerTuplesCurrentAndCup : List ( String, Int ) -> Int -> List Int -> Model
fromPlayerTuplesCurrentAndCup tuples currentPlayerIndex cup =
    let
        tupleToPlayer ( name, diceCount ) =
            { name = name, diceCount = diceCount }
    in
        { tablePlayers = List.map tupleToPlayer tuples
        , myCup = Dice.cupFromIntList cup
        , currentPlayerIndex = currentPlayerIndex
        }


noPlayers : TablePlayers
noPlayers =
    []


view : (Msg -> msg) -> Model -> Html msg
view privateMsg { tablePlayers, myCup, currentPlayerIndex } =
    div []
        [ h3 [] [ text "Players" ]
        , playersView tablePlayers currentPlayerIndex
        , h3 [] [ text "My Cup" ]
        , Dice.viewCup myCup
        ]


playersView : TablePlayers -> Int -> Html msg
playersView tablePlayers currentPlayerIndex =
    div [] <|
        List.indexedMap
            (\index player -> playerView player (currentPlayerIndex == index))
            tablePlayers


playerView : TablePlayer -> Bool -> Html msg
playerView { name, diceCount } isCurrentPlayer =
    let
        backgroundColourOfCurrentPlayer =
            if isCurrentPlayer then
                "#0f0"
            else
                "#cfc"

        optionalLiarButtonDiv =
            if isCurrentPlayer then
                [ div [] [ liarButton name ] ]
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
