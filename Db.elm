module Db exposing (..)

import Types exposing (..)
import Json.Decode as Decode exposing (..)
import Json.Encode as Encode exposing (..)
import Http


hostUser : String
hostUser =
    "http://localhost:3000/login"


hostFolder : String
hostFolder =
    "http://localhost:3000/folders"


hostNote : String
hostNote =
    "http://localhost:3000/notes"


encondeUser : User -> Encode.Value
encondeUser usr =
    Encode.object
        [ ( "nickname", Encode.string usr.nickname )
        , ( "password", Encode.string usr.password )
        ]



--encode: elm -> json -> post request
-- por eso no necesitas pasarle un id, la db lo genera solo


postUser : User -> Http.Request ()
postUser usr =
    Http.request
        { method = "POST"
        , headers = []
        , url = hostUser
        , body = Http.jsonBody (encondeUser usr)
        , expect = Http.expectStringResponse (\_ -> Ok ())
        , timeout = Nothing
        , withCredentials = False
        }


decUser : Decode.Decoder User
decUser =
    Decode.map3 User
        (Decode.field "id" Decode.int)
        (Decode.field "nickname" Decode.string)
        (Decode.field "password" Decode.string)


decodeUser : Decoder (List User)
decodeUser =
    Decode.list decUser


getUsers : Model -> Http.Request (List User)
getUsers model =
    Http.get (hostUser ++ "?nickname=eq." ++ model.nickname ++ "&password=eq." ++ model.password) decodeUser



-- *** *** *** F O L D E R *** *** ***


encondeFolder : Folder -> Encode.Value
encondeFolder fld =
    Encode.object
        [ ( "creator", Encode.string fld.creator )
        , ( "title", Encode.string fld.title )
        ]


postFolder : Folder -> Http.Request ()
postFolder fld =
    Http.request
        { method = "POST"
        , headers = []
        , url = hostFolder
        , body = Http.jsonBody (encondeFolder fld)
        , expect = Http.expectStringResponse (\_ -> Ok ())
        , timeout = Nothing
        , withCredentials = False
        }


decFolder : Decode.Decoder Folder
decFolder =
    Decode.map3 Folder
        (Decode.field "id" Decode.int)
        (Decode.field "creator" Decode.string)
        (Decode.field "title" Decode.string)


decodeFolder : Decoder (List Folder)
decodeFolder =
    Decode.list decFolder


getFolders : Model -> Http.Request (List Folder)
getFolders model =
    Http.get
        (hostFolder ++ "?creator=eq." ++ model.nickname)
        decodeFolder



-- *** *** *** N O T E *** *** ***


encondeNote : Note -> Encode.Value
encondeNote nt =
    Encode.object
        [ ( "folder", Encode.int nt.folder )
        , ( "title", Encode.string nt.title )
        , ( "description", Encode.string nt.content )
        ]


postNote : Note -> Http.Request ()
postNote fld =
    Http.request
        { method = "POST"
        , headers = []
        , url = hostNote
        , body = Http.jsonBody (encondeNote fld)
        , expect = Http.expectStringResponse (\_ -> Ok ())
        , timeout = Nothing
        , withCredentials = False
        }


decNote : Decode.Decoder Note
decNote =
    Decode.map4 Note
        (Decode.field "id" Decode.int)
        (Decode.field "folder" Decode.int)
        (Decode.field "title" Decode.string)
        (Decode.field "description" Decode.string)


decodeNote : Decoder (List Note)
decodeNote =
    Decode.list decNote


getNotes : Int -> Http.Request (List Note)
getNotes int =
    Http.get
        (hostNote ++ "?folder=eq." ++ toString (int))
        decodeNote



-- holi
-- deleteTarea : Tarea -> Http.Request ()
-- deleteTarea tar =
--     Http.request
--         { method = "delete"
--         , url = host ++ "?id=eq." ++ toString tar.ide
--         , body = Http.emptyBody
--         , headers = []
--         , expect = Http.expectStringResponse (\_ -> Ok ())
--         , timeout = Nothing
--         , withCredentials = False
--         }
--
--
-- patchTarea : Tarea -> Http.Request ()
-- patchTarea tar =
--     Http.request
--         { method = "PATCH"
--         , headers = []
--         , url = host ++ "?id=eq." ++ (toString tar.ide)
--         , body = Http.jsonBody (tareaEncoder tar)
--         , expect = Http.expectStringResponse (\_ -> Ok ())
--         , timeout = Nothing
--         , withCredentials = False
--         }
