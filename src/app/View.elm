module View exposing (..)

import Types exposing (..)
import Dice exposing (Cup)
import Html exposing (..)
import Table


-- VIEW


root : Game -> Html Msg
root model =
    div []
        [ h1 []
            [ text "Liar's Dice" ]
          --        , p []
          --            [ text ("Amount: " ++ toString model.currentBid.amount) ]
          --        , p []
          --            [ text ("FaceValue: " ++ toString model.currentBid.faceValue) ]
          --        , p []
          --            [ text ("Player: " ++ firstPlayer model.players) ]
        , tableView
            2
            [ Player "Tessa" 6
            , Player "Raul" 2
            , Player "Tracey" 6
            , Player "Casper" 0
            ]
            [ 1, 2, 5, 4, 1, 6 ]
        ]


firstPlayer : List Player -> String
firstPlayer players =
    case List.head players of
        Just player ->
            player.playerName

        Nothing ->
            "No Players Found"


tableView : Int -> List Player -> Dice.Cup -> Html Msg
tableView currentPlayerId players cup =
    let
        playerToTablePlayer id { playerName, diceCount } =
            { id = id, name = playerName, diceCount = diceCount }

        tablePlayers =
            List.indexedMap playerToTablePlayer players
    in
        Table.view { tablePlayers = tablePlayers, myCup = cup, currentPlayerId = currentPlayerId }
