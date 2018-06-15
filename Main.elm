module Main exposing (..)

import Html exposing (..)
import Types exposing (..)
import Db exposing (..)
import Views exposing (..)
import MainView exposing (..)
import FolderView exposing (..)
import NoteView exposing (..)


{-| -}
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


view : Model -> Html Msg
view model =
    case model.currentView of
        MainView ->
            mainView model

        FolderView ->
            showFolders model

        NoteView ->
            showNotes model

        _ ->
            encabezado



--
--     ErrorView error ->
--         errorView error
--
--     FolderView usr ->
--         folderView usr
--
--     NoteView ->
--         onlyView model
--
--     CreateFolder error ->
--         errorView1 error
--
--     CreateNote error ->
--         errorView2 error
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Login ->
            ( model, Cmd.none )

        SignUp ->
            ( { model | currentView = FolderView }, Cmd.none )

        ViewNotes ->
            ( { model | currentView = NoteView }, Cmd.none )

        Exit ->
            ( { model | currentView = MainView }, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- NewFolder ->
--     ({ model | currentView = CreateFolder })
--
-- SubmitFolder ->
--     ( model, Cmd.none )
--
-- NewNote ->
--     ({ model | currentView = CreateNote })
--
-- SubmitNote ->
--     ( model, Cmd.none )
--
-- Exit ->
--     ({ model | currentView = MainView })
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none
