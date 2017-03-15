module Types exposing (..)


type alias CupOfDice =
    List Int


type alias GameState =
    { players : List Player
    , currentBid : Bid
    , currentPlayer : Int
    , cup : Maybe CupOfDice
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
    = Increment Int
    | Decrement Int
    | UpdateAmount String
