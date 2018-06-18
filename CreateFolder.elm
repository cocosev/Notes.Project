module CreateFolder exposing (..)

--import FolderView exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)


--import Views exposing (..)

import Html.Events exposing (onClick, onInput)


createFolder : Model -> Html Msg
createFolder model =
    div []
        [ div [ class "row" ] []
        , div [ class "row" ] []
        , div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card pink lighten-4 ", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title text center" ] [ text "New Folder" ]
                    , div [ class "card-content text center" ] [ text "Please write the title of the folder and click submit" ]
                    , div [ class "row" ]
                        [ div [ class "col s6 offset-s3" ]
                            [ div [ class "input-field" ]
                                [ input [ id "folder", type_ "text" ] []
                                , label [ for "folder" ] [ text "Folder Title" ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col s2  offset-s4" ]
                            [ div [ class "btn waves-effect waves-light", onClick (SignUp) ]
                                [ text "Submit" ]
                            ]
                        , div [ class "col s3 " ]
                            [ div
                                [ class "btn waves-effect waves-light", onClick (SignUp) ]
                                [ text "cancel" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
