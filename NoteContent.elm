module NoteContent exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


noteContent : Model -> Html Msg
noteContent model =
    div [ class "row" ]
        [ div [ class "col s6 offset-s3" ]
            [ div [ class "card yellow", style [ ( "padding", "10px" ) ] ]
                [ div [ class "card-title", style [ ( "padding", "10px" ) ] ] [ text "Note Title" ]
                , div [ class "card-content" ]
                    [ text " This is the content of your note, what you wrote is stored here waiting for you to read it, I hope you like it baby"
                    ]
                , div [ class "row" ]
                    [ div [ class "col s2  offset-s4" ]
                        [ div [ class "btn waves-effect waves-light", onClick (SignUp) ]
                            [ text "Edit" ]
                        ]
                    , div [ class "col s3 " ]
                        [ div
                            [ class "btn waves-effect waves-light", onClick (SignUp) ]
                            [ text "Back" ]
                        ]
                    ]
                ]
            ]
        ]
