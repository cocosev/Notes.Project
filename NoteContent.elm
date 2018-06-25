module NoteContent exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


noteContent : Note -> Html Msg
noteContent note =
    div [ class "row" ]
        [ div [ class "col s6 offset-s3" ]
            [ div [ class "card yellow", style [ ( "padding", "10px" ) ] ]
                [ div [ class "card-title", style [ ( "padding", "10px" ) ] ] [ text note.title ]
                , div [ class "card-content" ]
                    [ text note.content
                    ]
                , div [ class "row" ]
                    [ div [ class "col s2  offset-s4" ]
                        [ div [ class "btn waves-effect waves-light", onClick (SignUp) ]
                            [ text "Edit" ]
                        ]
                    , div [ class "col s3 " ]
                        [ div
                            [ class "btn waves-effect waves-light", onClick (ViewNotes) ]
                            [ text "Back" ]
                        ]
                    ]
                ]
            ]
        ]
