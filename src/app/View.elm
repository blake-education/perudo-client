module View exposing (..)

import Types exposing (..)
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
        ]


firstPlayer : List Player -> String
firstPlayer players =
    case List.head players of
        Just player ->
            player.playerName

        Nothing ->
            "No Players Found"


tableView : Html Msg
tableView =
    Html.map TableMsg (Table.view Table.init)
