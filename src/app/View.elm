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
            [ Player "Joe" 6
            , Player "Garrett" 2
            , Player "Martin" 6
            , Player "Julian" 0
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
tableView currentPlayerIndex players cup =
    let
        tupleFromPlayer { playerName, diceCount } =
            ( playerName, diceCount )

        playerTuples =
            List.map tupleFromPlayer players
    in
        Table.view Types.TableAction <|
            Table.fromPlayerTuplesCurrentAndCup playerTuples currentPlayerIndex cup
