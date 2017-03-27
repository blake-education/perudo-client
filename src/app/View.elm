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
        , tableView [] []
        ]


firstPlayer : List Player -> String
firstPlayer players =
    case List.head players of
        Just player ->
            player.playerName

        Nothing ->
            "No Players Found"


tableView : List Player -> Dice.Cup -> Html Msg
tableView players cup =
    let
        -- we have to fake ids until we have them
        idAndPlayerTo3Tuple id { playerName, diceCount } =
            ( id, playerName, diceCount )

        ids =
            List.range 1 <| List.length players

        playersTuples =
            List.map2 idAndPlayerTo3Tuple ids players
    in
        Table.view Types.TableAction <| Table.initWithPlayersAndCup playersTuples cup
