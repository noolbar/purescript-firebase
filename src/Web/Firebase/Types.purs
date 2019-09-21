module Web.Firebase.Types where

-- in process of moving the to string conversion function here, as it belongs with the typeclass

import Prelude

import Control.Monad.Trans.Class (lift)
import Data.Generic.Rep (class Generic)
import Effect.Aff (Aff)
import Effect.Aff.Class (class MonadAff)
import Foreign.Class (class Decode, class Encode)
import Foreign.Generic (Foreign, defaultOptions, genericDecode, genericEncode)

class Dblike a
class DataSnapshot a
class ToString a
class ToJSON a

type Key = String
type Schema = String

class Monad m ⇐ FirebaseImplement m where
  firebaseRef ∷ m Firebase

newtype FirebaseConfig = FirebaseConfig FirebaseConfigRecord

mkFirebaseConfig ∷ FirebaseConfigRecord → FirebaseConfig
mkFirebaseConfig = FirebaseConfig

type FirebaseConfigRecord = {
    apiKey ∷ String
  , appId ∷ String
  , authDomain ∷ String
  , databaseURL ∷ String
  , messagingSenderId ∷ String
  , projectId ∷ String
  , storageBucket ∷ String
}

derive instance genericFirebaseConfig ∷ Generic FirebaseConfig _
instance decodeFirebaseConfig ∷ Decode FirebaseConfig where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true}
instance encodeFirebaseConfig ∷ Encode FirebaseConfig where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true}

foreign import  data Unsubscribe ∷ Type

-------------------
foreign import data Firebase ∷ Type
foreign import data FirebaseEff ∷ Type
foreign import data FirebaseError ∷ Type

foreign import firestoreErrorToString ∷ FirestoreError → String
instance showFirestoreErr ∷ Show FirestoreError where
  show = firestoreErrorToString
instance eqFirebaseErr ∷ Eq FirebaseError where
  eq e1 e2 = (firebaseErrorToString e1) == (firebaseErrorToString e2)

foreign import firebaseErrorToString ∷ FirebaseError → String
instance showFirebaseErr ∷ Show FirebaseError where
  show = firebaseErrorToString

foreign import data FirestoreError ∷ Type
instance eqFirestoreErr ∷ Eq FirestoreError where
  eq e1 e2 = (firestoreErrorToString e1) == (firestoreErrorToString e2)

------------
foreign import data App ∷ Type
foreign import data Auth ∷ Type
foreign import data OAuthCredential ∷ Type
foreign import data GithubAuthProvider ∷ Type
-------------
foreign import data Database ∷ Type
instance dbDatabase ∷ Dblike Database
instance toStringDatabese ∷ ToString Database
instance toJSONDatabase ∷ ToJSON Database
instance dsDatabase ∷ DataSnapshot Database
-------------
foreign import data Firestore ∷ Type

foreign import data Document ∷ Type
foreign import data DocumentData ∷ Type
foreign import data DocumentSnapshot ∷ Type

class FirestoreQuery q
foreign import data FQuery ∷ Type
instance likeQuery :: FirestoreQuery FQuery

foreign import data Collection ∷ Type
instance queryCollection :: FirestoreQuery Collection

foreign import data WriteBatch ∷ Type
foreign import data PersistenceSettings ∷ Type
foreign import data Settings ∷ Type
foreign import data QuerySnapshot ∷ Type
foreign import data QueryDocumentSnapshot ∷ Type
-------------
foreign import data Storage ∷ Type
instance dbStorage ∷ Dblike Storage

------------
data LogLevel = Debug
              | Error
              | Silent
instance showLogLevel ∷ Show LogLevel where
  show t = case t of
    Debug → "debug"
    Error → "error"
    Silent → "silent"

data OrderByDirection = Desc
                      | Asc
instance showOrderByDirection ∷ Show OrderByDirection where
  show t = case t of
    Desc → "desc"
    Asc → "asc"

data DocumentChangeType = Added
                        | Removed
                        | Modified
instance showDocumentChangeType ∷ Show DocumentChangeType where
  show t = case t of
    Added → "added"
    Removed → "removed"
    Modified → "modified"

data WhereFilterOp = LTOp
                   | LTEQOp
                   | EQOp
                   | GTEQOp
                   | GTOp
                   | ArrayContainsOp
instance showDWhereFilterOp ∷ Show WhereFilterOp where
  show t = case t of
    LTOp → "<"
    LTEQOp → "<="
    EQOp → "=="
    GTEQOp → ">="
    GTOp → ">"
    ArrayContainsOp → "array-contains"

class Multipath a
instance multipathString ∷ Multipath String
instance muttipathArrayString ∷ Multipath (Array String)

data GetOptions = Default
                | Server
                | Cache
instance showGetOptions ∷ Show GetOptions where
  show t = case t of
    Default → "default"
    Server → "server"
    Cache → "cache"



data EventType = Value
               | ChildAdded
               | ChildChanged
               | ChildRemoved
               | ChildMoved

-- | Boilerplate, but we have data instead of newtype
-- so generics don't work here
instance eqEventType ∷ Eq EventType where
  eq Value        Value = true
  eq ChildAdded   ChildAdded = true
  eq ChildChanged ChildChanged = true
  eq ChildRemoved ChildRemoved = true
  eq ChildMoved   ChildMoved = true
  eq _            _     = false

-- | Boilerplate, but we have data instead of newtype
-- so generics don't work here
-- provided so we can make a set of EventTypes
instance ordEventType ∷ Ord EventType where
  compare ev1 ev2 = compare (numValue ev1) (numValue ev2)
    where
      numValue Value = 0
      numValue ChildAdded = 1
      numValue ChildChanged = 2
      numValue ChildRemoved = 3
      numValue ChildMoved = 4

showEventType ∷ EventType → String
showEventType t = case t of
  Value → "value"
  ChildAdded → "child_added"
  ChildChanged → "child_changed"
  ChildRemoved → "child_removed"
  ChildMoved → "child_moved"

instance show4EventType ∷ Show EventType where
  show = showEventType

type SetOptions = Foreign
type SnapshotOption = Foreign
