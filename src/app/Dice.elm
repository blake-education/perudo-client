module Dice exposing (emptyCup, Cup, cupFromIntList, viewDie, viewCup, describeCount)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)


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
    svg [ viewBox "0 0 300 300", width "100px", height "100px" ]
        [ Svg.rect
            [ x "50"
            , y "50"
            , rx "10"
            , ry "10"
            , width "150"
            , height "150"
            , fill "#cce"
            , stroke "black"
            , strokeWidth "4"
            ]
            [ Svg.animate
                [ id "anim1"
                , attributeName "fill"
                , from "#cfc"
                , to "#ccf"
                , dur "10s"
                , begin "0s; anim2.end"
                ]
                []
            , Svg.animate
                [ id "anim2"
                , attributeName "fill"
                , from "#ccf"
                , to "#cfc"
                , dur "10s"
                , begin "anim1.end"
                ]
                []
            ]
        , Svg.text_
            [ x "110", y "140", fontSize "50px", fontFamily "verdana", fontWeight "100" ]
            [ Svg.text (toString die) ]
        ]


viewCup : Cup -> Html msg
viewCup cup =
    Html.div [] <|
        List.map viewDie cup


describeCount : Int -> String
describeCount diceCount =
    if diceCount == 1 then
        "1 die"
    else
        toString diceCount ++ " dice"
