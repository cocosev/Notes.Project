module Types exposing (..)


type alias Model =
    { user : String
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
    | ErrorView
    | FolderView
    | NoteView
    | CreateFolder
    | CreateNote
    | NoteContent


type Msg
    = Login
    | SignUp
    | NewFolder
    | SubmitFolder
    | ViewNotes
    | NewNote
    | SubmitNote
    | Exit
    | ShowNote
