module Types exposing (..)

import TableMsg
import Dice


type alias PlayerID =
    Int


type alias PlayerName =
    String


type alias Game =
    { gameState : Maybe GameState
    , cup : Maybe Dice.Cup
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
    { playerName : PlayerName
    , diceCount : Int
    }


type Msg
    = CallLiar Int
    | MakeBid Bid
    | GetCup
    | SetCup Dice.Cup
    | NextServerState ServerState
    | RoundFinished RoundResult
    | TableAction TableMsg.Msg


makeCallLiarMsg =
    CallLiar
