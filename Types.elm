module Types exposing (..)

import Http


type alias Model =
    { nickname : String
    , password : String
    , folder : String
    , folderId : Int
    , noteTitle : String
    , noteDescription : String
    , folders : List Folder
    , notes : List Note
    , currentView : CurrentView
    }


init : ( Model, Cmd msg )
init =
    ( Model "" "" "" 0 "" "" [] [] MainView, Cmd.none )


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
    , folder : Int
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
    | NoteContent Note
    | TryView (List User)
    | TryAgainView
    | ErasingError


type Msg
    = Login
      --| Back
    | SignUp
    | NewFolder
    | FolderTitle String
    | SubmitFolder
    | Nickname String
    | Password String
    | ViewNotes
    | ViewFolders
    | GetNotes Int
    | NewNote
    | NoteTitle String
    | NoteDescription String
    | SubmitNote
    | Exit
    | ShowNote Note
    | RespGetUser (Result Http.Error (List User))
    | RespPostUser (Result Http.Error ())
    | RespPostFolder (Result Http.Error ())
    | RespPostNote (Result Http.Error ())
    | RespGetNote (Result Http.Error (List Note))
    | RespGetFolder (Result Http.Error (List Folder))
    | Delete Note
    | RespDelete (Result Http.Error ())
    | Erase Folder
    | RespErase (Result Http.Error ())
