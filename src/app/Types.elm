module Types exposing (..)

import Table


type alias CupOfDice =
    List Int


type alias Game =
    { gameState : Maybe GameState
    , cup : Maybe CupOfDice
    , id : Int
    }


type GameState
    = Server ServerState
    | Round RoundResult


type alias ServerState =
    { players : List Player
    , currentBid : Bid
    , currentPlayer : Int
    }


type alias RoundResult =
    { liarCaller : Int
    , liarCallee : Int
    , didCaleeLie : Bool
    , gameWon : Bool
    }


type alias Bid =
    { amount : Int
    , faceValue : Int
    }


type alias Player =
    { playerName : String
    , diceCount : Int
    }


type Msg
    = CallLiar Int
    | MakeBid Bid
    | GetCup
    | SetCup CupOfDice
    | NextServerState ServerState
    | RoundFinished RoundResult
    | TableMsg Table.Msg
