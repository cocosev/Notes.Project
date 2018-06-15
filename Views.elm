module Views exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)


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


errorView : String -> Html Msg
errorView error =
    div [] [ text error ]



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
