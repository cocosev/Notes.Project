module FolderView exposing (..)

--import Views exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick, onInput)


showFolders : Model -> Html Msg
showFolders model =
    div []
        [ div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card pink lighten-2", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title", style [ ( "padding", "10px" ) ] ] [ text "Your folders" ]
                    , div [ class "card-content" ]
                        [ ul [ class "collection" ]
                            [ li [ class "collection-item pink lighten-4" ]
                                [ text "folder 1"
                                , a [ class "secondary-content" ]
                                    [ a
                                        [ onClick ViewNotes ]
                                        [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "details" ] ]
                                    ]
                                ]
                            , li [ class "collection-item pink lighten-4" ]
                                [ text "folder 2"
                                , a [ class "secondary-content" ]
                                    [ a
                                        [ onClick ViewNotes ]
                                        [ i [ class "material-icons", style [ ( "color", "teal" ) ] ] [ text "details" ] ]
                                    ]
                                ]
                            ]
                        , div
                            [ class "center" ]
                            [ div
                                [ class "row" ]
                                [ div [ class "col s3 offset-s3" ]
                                    [ div [ class "btn waves-effect waves-light", onClick (NewFolder) ]
                                        [ text "Create" ]
                                    ]
                                , div
                                    [ class "col s3" ]
                                    [ div [ class "btn waves-effect waves-light", onClick (Exit) ]
                                        [ text "Log Out" ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
