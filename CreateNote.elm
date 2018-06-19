module CreateNote exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick, onInput)


createNote : Model -> Html Msg
createNote model =
    div []
        [ div [ class "row" ] []
        , div [ class "row" ] []
        , div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card yellow ", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title text center" ] [ text "New Note" ]
                    , div [ class "card-content text center" ] [ text "Please write the title and content of your note and click submit" ]
                    , div [ class "row" ]
                        [ div [ class "col s6 offset-s3" ]
                            [ div [ class "input-field" ]
                                [ input [ id "title", type_ "text" ] []
                                , label [ for "title" ] [ text "User Title" ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col s6 offset-s3" ]
                            [ div [ class "input-field" ]
                                [ input [ id "cnt", type_ "text", onInput NoteTitle, Attr.value model.note ] []
                                , label [ for "cnt" ] [ text "Content of your note" ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col s2  offset-s4" ]
                            [ div [ class "btn waves-effect waves-light", onClick (ViewNotes) ]
                                [ text "Submit" ]
                            ]
                        , div [ class "col s3 " ]
                            [ div
                                [ class "btn waves-effect waves-light", onClick (ViewNotes) ]
                                [ text "cancel" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
