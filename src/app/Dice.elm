module Dice exposing (emptyCup, Cup, cupFromIntList, viewDie, viewCup, describeCount)

import Html.Attributes exposing (..)
import Html exposing (..)


type alias Die =
    Int


type alias Cup =
    List Die


emptyCup : Cup
emptyCup =
    []


cupFromIntList : List Int -> Cup
cupFromIntList =
    identity


viewDie : Die -> Html msg
viewDie die =
    div
        [ style
            [ ( "border", "2px solid black" )
            , ( "width", "50px" )
            , ( "height", "50px" )
            , ( "padding", "5px" )
            , ( "margin", "5px" )
            , ( "display", "inline-block" )
            , ( "text-align", "center" )
            ]
        ]
        [ text <| toString die ]


viewCup : Cup -> Html msg
viewCup cup =
    div [] <|
        List.map viewDie cup


describeCount : Int -> String
describeCount diceCount =
    if diceCount == 1 then
        "1 die"
    else
        toString diceCount ++ " dice"
