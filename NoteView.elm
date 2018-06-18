module NoteView exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick, onInput)


showNotes : Model -> Html Msg
showNotes model =
    div [ class "row" ]
        [ div [ class "col s6 offset-s3" ]
            [ div [ class "card yellow", style [ ( "padding", "10px" ) ] ]
                [ div [ class "card-title", style [ ( "padding", "10px" ) ] ] [ text "Your Notes" ]
                , div [ class "card-content" ]
                    [ ul [ class "collection" ]
                        [ li [ class "collection-item yellow lighten-3" ]
                            [ text "Note 1"
                            , a [ class "secondary-content" ]
                                [ a [ onClick ShowNote ] [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "details" ] ]
                                , a
                                    []
                                    [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "delete" ] ]
                                ]
                            ]
                        , li [ class "collection-item yellow lighten-3" ]
                            [ text "Note 2"
                            , a [ class "secondary-content" ]
                                [ a [ onClick ShowNote ] [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "details" ] ]
                                , a
                                    []
                                    [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "delete" ] ]
                                ]
                            ]
                        , li [ class "collection-item yellow lighten-3" ]
                            [ text "Note 2"
                            , a [ class "secondary-content" ]
                                [ a [ onClick ShowNote ] [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "details" ] ]
                                , a
                                    []
                                    [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "delete" ] ]
                                ]
                            ]
                        ]
                    ]
                , div [ class "center" ]
                    [ div [ class "row" ]
                        [ div [ class "col s2  offset-s4" ]
                            [ div [ class "btn waves-effect waves-light", onClick (SignUp) ]
                                [ text "Back" ]
                            ]
                        , div [ class "col s2 " ]
                            [ div
                                [ class "btn waves-effect waves-light", onClick NewNote ]
                                [ text "Add" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
