module Views exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick)


--import Html.Events exposing (onInput, onClick)


encabezado : Html Msg
encabezado =
    div [ class "teal lighten-3" ]
        [ div [ class "row" ]
            [ div [ class "grid-example col s12" ]
                -- all rows get to have it
                [ h1 [ class "text center" ]
                    [ text "writeyournotes.rw" ]
                , h4 [ class "text center" ] [ text "Write and store your notes as they come out of your head" ]
                ]
            ]
        ]


errorView : String -> Model -> Html Msg
errorView error model =
    div []
        [ div []
            [ text error
            ]
        , div [] []
        , div [ class "color pink lighten-3" ] [ text (toString model) ]
        ]


tryView : a -> Model -> Html Msg
tryView a model =
    div []
        [ div [ class "color pink lighten-3" ] [ text (toString a) ]
        , div [] [ text (toString model) ]
        ]


tryAgainView : Model -> Html Msg
tryAgainView model =
    div []
        [ div [ class "row" ] []
        , div [ class "row" ] []
        , div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card pink lighten-4 ", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title text center" ] [ text "We are sorry" ]
                    , div [ class "card-content text center" ]
                        [ text "The user name that you are trying to introduce does not exist or maybe your password is incorrect"
                        , div
                            [ class "centered" ]
                            [ div [ class "btn waves-effect waves-light", onClick (Exit) ]
                                [ text "Back" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


eraseFolderErrorView : Model -> Html Msg
eraseFolderErrorView model =
    div []
        [ div [ class "row" ] []
        , div [ class "row" ] []
        , div [ class "row" ]
            [ div [ class "col s6 offset-s3" ]
                [ div [ class "card pink lighten-4 ", style [ ( "padding", "10px" ) ] ]
                    [ div [ class "card-title text center" ] [ text "We are sorry" ]
                    , div [ class "card-content text center" ]
                        [ text "You cannot delete a folder that is not empty"
                        , div
                            [ class "centered" ]
                            [ div [ class "btn waves-effect waves-light", onClick (ViewFolders) ]
                                [ text "Back" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]



-- tareasPendientes : Model -> Html Msg
-- tareasPendientes model =
--     div [ class "col l3 offset-l3" ]
--         [ div [ class "card pink lighten-3 ", style [ ( "padding", "10px" ) ] ]
--             [ span [ class "card-title" ] [ text "Still Pending :(" ]
--             , ul [ class "collection" ]
--                 (List.map
--                     (\task ->
--                         li [ class " collection-item pink lighten-4" ]
--                             [ text task.tarea
--                             , a
--                                 [ class "secondary-content "
--                                 ]
--                                 [ label []
--                                     [ input
--                                         [ type_ "checkbox", checked task.estado ]
--                                         []
--                                     , span [] [ text "" ]
--                                     ]
--                                 ]
--                             ]
--                     )
--                     (model.pending)
--                 )
--             ]
--         ]
