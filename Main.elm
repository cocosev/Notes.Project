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

            NoteContent note ->
                noteContent note

            CreateNote ->
                createNote model

            ErrorView error ->
                errorView error model

            TryView ls ->
                tryView ls model

            TryAgainView ->
                tryAgainView model

            ErasingError ->
                eraseFolderErrorView model
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
            ( model
            , Http.send RespGetUser (getUsers model)
            )

        RespGetUser (Ok usr) ->
            if usr /= [] then
                ( model
                , Http.send RespGetFolder (getFolders model)
                )
            else
                ( { model
                    | currentView = TryAgainView
                  }
                , Cmd.none
                )

        RespGetUser (Err error) ->
            ( { model
                | nickname = ""
                , password = ""
                , currentView = ErrorView (toString error)
              }
            , Cmd.none
            )

        SignUp ->
            if (model.nickname /= "") && (model.password /= "") then
                ( model
                , Http.send RespPostUser (postUser (User 0 model.nickname model.password))
                )
            else
                ( model, Cmd.none )

        Nickname nn ->
            ( { model | nickname = nn }, Cmd.none )

        Password pw ->
            ( { model | password = pw }, Cmd.none )

        GetNotes ls ->
            ( { model | folderId = ls }, Http.send RespGetNote (getNotes ls) )

        ViewNotes ->
            ( { model | noteTitle = "", noteDescription = "", currentView = NoteView }, Cmd.none )

        NewNote ->
            ( { model | currentView = CreateNote }, Cmd.none )

        ShowNote nt ->
            ( { model | currentView = NoteContent nt }, Cmd.none )

        NewFolder ->
            ( { model | currentView = CreateFolder }, Cmd.none )

        Exit ->
            ( { model | nickname = "", password = "", folder = "", folderId = 0, folders = [], currentView = MainView }, Cmd.none )

        RespPostUser (Ok ()) ->
            ( { model | currentView = FolderView }, Cmd.none )

        RespPostUser (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        ViewFolders ->
            ( { model | noteTitle = "", noteDescription = "", folder = "", currentView = FolderView }, Cmd.none )

        FolderTitle fld ->
            ( { model | folder = fld }, Cmd.none )

        NoteTitle nt ->
            ( { model | noteTitle = nt }, Cmd.none )

        NoteDescription ls ->
            ( { model | noteDescription = ls }, Cmd.none )

        SubmitFolder ->
            if (model.folder /= "") then
                ( model
                , Http.send RespPostFolder (postFolder (Folder 0 model.nickname model.folder))
                )
            else
                ( model, Cmd.none )

        SubmitNote ->
            if (model.noteTitle /= "" && model.noteDescription /= "") then
                ( model
                , Http.send RespPostNote (postNote (Note 0 model.folderId model.noteTitle model.noteDescription))
                )
            else
                ( model, Cmd.none )

        RespPostFolder (Ok ()) ->
            ( { model | folder = "" }
            , Http.send RespGetUser (getUsers model)
            )

        RespPostFolder (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        RespPostNote (Ok ()) ->
            ( { model | noteTitle = "", noteDescription = "" }
            , Http.send RespGetNote (getNotes model.folderId)
            )

        RespPostNote (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        RespGetFolder (Ok ls) ->
            ( { model | folders = ls, currentView = FolderView }, Cmd.none )

        RespGetFolder (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        RespGetNote (Ok ls) ->
            ( { model | notes = ls, currentView = NoteView }, Cmd.none )

        RespGetNote (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        Delete nt ->
            ( model
            , Http.send RespDelete (deleteNote nt)
            )

        RespDelete result ->
            case result of
                Ok () ->
                    update (GetNotes model.folderId) { model | noteTitle = "", noteDescription = "" }

                Err err ->
                    ( { model | currentView = ErrorView (toString err) }, Cmd.none )

        Erase fld ->
            ( model
            , Http.send RespErase (deleteFolder fld)
            )

        RespErase result ->
            case result of
                Ok () ->
                    ( { model | folder = "" }, Http.send RespGetUser (getUsers model) )

                Err err ->
                    ( { model | currentView = ErasingError }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none
