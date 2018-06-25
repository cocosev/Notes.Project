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

            TryView ls ->
                tryView ls model

            TryAgainView ->
                tryAgainView model
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

        ViewNotes ->
            ( { model | currentView = NoteView }, Cmd.none )

        NewNote ->
            ( { model | currentView = CreateNote }, Cmd.none )

        ShowNote ->
            ( { model | currentView = NoteContent }, Cmd.none )

        NewFolder ->
            ( { model | currentView = CreateFolder }, Cmd.none )

        Exit ->
            ( { model | nickname = "", password = "", folder = "", folders = [], currentView = MainView }, Cmd.none )

        RespPostUser (Ok ()) ->
            ( { model | currentView = FolderView }, Cmd.none )

        RespPostUser (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        ViewFolders ->
            ( { model | currentView = FolderView }, Cmd.none )

        FolderTitle fld ->
            ( { model | folder = fld }, Cmd.none )

        NoteTitle nt ->
            ( { model | note = nt }, Cmd.none )

        SubmitFolder ->
            if (model.folder /= "") then
                ( model
                , Http.send RespPostFolder (postFolder (Folder 0 model.nickname model.folder))
                )
            else
                ( model, Cmd.none )

        SubmitNote ->
            if (model.note /= "") then
                ( model
                , Http.send RespPostNote (postNote (Note 0 0 model.nickname model.folder))
                )
            else
                ( model, Cmd.none )

        RespPostFolder (Ok ()) ->
            ( model
            , Http.send RespGetUser (getUsers model)
            )

        RespPostFolder (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        RespPostNote (Ok ()) ->
            ( { model | currentView = NoteView }, Cmd.none )

        RespPostNote (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        RespGetFolder (Ok ls) ->
            ( { model | folders = ls, currentView = FolderView }, Cmd.none )

        RespGetFolder (Err error) ->
            ( { model | currentView = ErrorView (toString error) }, Cmd.none )

        _ ->
            ( { model | currentView = FolderView }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none
