module Main exposing (..)

import Html exposing (..)
import Types exposing (..)
import Db exposing (..)
import Views exposing (..)
import MainView exposing (..)
import FolderView exposing (..)
import NoteView exposing (..)
import CreateFolder exposing (..)
import Html.Attributes as Attr exposing (..)
import NoteContent exposing (..)
import CreateNote exposing (..)
import Http


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
    div [ class "teal lighten-5", style [ ( "height", "100%" ) ] ]
        [ encabezado
        , case model.currentView of
            MainView ->
                mainView model

            FolderView ->
                showFolders model

            NoteView ->
                showNotes model

            CreateFolder ->
                createFolder model

            NoteContent ->
                noteContent model

            CreateNote ->
                createNote model

            ErrorView error ->
                errorView error model
        ]



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
            ( { model | currentView = FolderView }, Cmd.none )

        SignUp ->
            if (model.password /= "") && (model.password /= "") then
                ( model
                , Http.send RespPostUser (postUser (User 0 model.nickname model.password))
                )
            else
                ( model, Cmd.none )

        Nickname nn ->
            ( { model | nickname = nn }, Cmd.none )

        Password pw ->
            ( { model | password = pw }, Cmd.none )

        ViewNotes ->
            ( { model | currentView = NoteView }, Cmd.none )

        NewNote ->
            ( { model | currentView = CreateNote }, Cmd.none )

        ShowNote ->
            ( { model | currentView = NoteContent }, Cmd.none )

        NewFolder ->
            ( { model | currentView = CreateFolder }, Cmd.none )

        Exit ->
            ( { model | nickname = "", password = "", currentView = MainView }, Cmd.none )

        RespPostUser (Ok ()) ->
            ( { model | currentView = FolderView }, Cmd.none )

        RespPostUser (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        ViewFolders ->
            ( { model | currentView = FolderView }, Cmd.none )

        FolderTitle fld ->
            ( { model | folder = fld }, Cmd.none )

        SubmitFolder ->
            if (model.password /= "") && (model.password /= "") then
                ( model
                , Http.send RespPostFolder (postFolder (Folder 0 model.nickname model.folder))
                )
            else
                ( model, Cmd.none )

        RespPostFolder (Ok ()) ->
            ( { model | currentView = FolderView }, Cmd.none )

        RespPostFolder (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        _ ->
            ( { model | currentView = FolderView }, Cmd.none )



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
