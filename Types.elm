module Types exposing (..)

import Http


type alias Model =
    { nickname : String
    , password : String
    , folder : String
    , note : String
    , folders : List Folder
    , notes : List Note
    , currentView : CurrentView
    }


init : ( Model, Cmd msg )
init =
    ( Model "" "" "" "" [] [] MainView, Cmd.none )


type alias User =
    { id : Int
    , nickname : String
    , password : String
    }


type alias Folder =
    { id : Int
    , creator : String
    , title : String
    }


type alias Note =
    { id : Int
    , folder : String
    , title : String
    , content : String
    }


type CurrentView
    = MainView
    | ErrorView String
    | FolderView
    | NoteView
    | CreateFolder
    | CreateNote
    | NoteContent


type Msg
    = Login
    | Back
    | SignUp
    | NewFolder
    | FolderTitle String
    | SubmitFolder
    | Nickname String
    | Password String
    | ViewNotes
    | ViewFolders
    | NewNote
    | SubmitNote
    | Exit
    | ShowNote
    | RespPostUser (Result Http.Error ())
    | RespPostFolder (Result Http.Error ())
