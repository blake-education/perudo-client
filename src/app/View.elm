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
        -- we have to fake ids until we have them
        idAndPlayerTo3Tuple id { playerName, diceCount } =
            ( id, playerName, diceCount )

        ids =
            List.range 1 <| List.length players

        playersTuples =
            List.map2 idAndPlayerTo3Tuple ids players
    in
        Table.view Types.TableAction <| Table.fromPlayersAndCup playersTuples cup
