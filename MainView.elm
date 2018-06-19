module MainView exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick, onInput)


mainView : Model -> Html Msg
mainView model =
    div []
        [ div [ class "row" ] []
        , div [ class "row" ] []
        , div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card pink lighten-4 ", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title text center" ] [ text "Welcome" ]
                    , div [ class "card-content text center" ] [ text "Please log in or register to access and write your own notes" ]
                    , div [ class "row" ]
                        [ div [ class "col s6 offset-s3" ]
                            [ div [ class "input-field" ]
                                [ input [ id "nickname", type_ "text", onInput Nickname, Attr.value model.nickname ] []
                                , label [ for "nickname" ] [ text "User Name" ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col s6 offset-s3" ]
                            [ div [ class "input-field" ]
                                [ input [ id "password", type_ "password", class "validate", onInput Password, Attr.value model.password ] []
                                , label [ for "password" ] [ text "Password" ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col s2  offset-s4" ]
                            [ div [ class "btn waves-effect waves-light", onClick (Login) ]
                                [ text "Log In" ]
                            ]
                        , div [ class "col s3 " ]
                            [ div
                                [ class "btn waves-effect waves-light", onClick (SignUp) ]
                                [ text "Sign Up" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
