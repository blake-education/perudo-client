module App exposing (main)

import Html exposing (..)
import Html.Attributes exposing (id, class, value, for)
import Html.Events exposing (onClick, onInput)

main : Program Never GameState Msg
main =
    Html.program
        { init = initialModel
        , update = update
        , subscriptions = subscriptions
        , view = rootView
        }



-- UPDATE


update : Msg -> GameState -> ( GameState, Cmd Msg )
update msg model = ( model, Cmd.none )


-- VIEW


rootView : GameState -> Html Msg
rootView model =
    div [  ]
        [ h1 []
            [ text "Liar's Dice" ]
         ,
          p []
            [text ("Amount: " ++ toString model.currentBid.amount)]
          ,
          p []
          [text ("FaceValue: " ++ toString model.currentBid.faceValue)]
          ,
          p []
          [text ("Player: " ++ firstPlayer model.players)]
        ]

firstPlayer: List Player -> String
firstPlayer players =
    case List.head players of
        Just player ->
             player.playerName
        Nothing ->
             "No Players Found"


-- MODEL


type alias GameState =
    { players: List Player
    , currentBid: Bid
    , currentPlayer: Int
    }

type alias Bid =
    { amount: Int
    , faceValue: Int
    }

type alias Player =
    { playerName: String
    , diceCount: Int
    }

initialModel : (GameState, Cmd Msg)
initialModel =
    (
      { players = [ Player "Joe" 6, Player "Mario" 6, Player "Kartik" 6 ]
      , currentBid = Bid 2 2
      , currentPlayer = 0
      }
      , Cmd.none
    )


type Msg
    = Increment Int
    | Decrement Int
    | UpdateAmount String



-- SUBSCRIPTIONS


subscriptions : GameState -> Sub Msg
subscriptions model =
    Sub.none
