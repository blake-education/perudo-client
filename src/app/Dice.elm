module Dice exposing (emptyCup, Cup, cupFromIntList)


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
