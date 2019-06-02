module Test.Main where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import Effect.Unsafe (unsafePerformEffect)
import FirebaseTestConfig (firebaseConfig)
import Simple.JSON (read, write)
import Web.Firebase (authWithApp, collection, doc, firestore, initializeApp, onAuthStateChanged, signInWithEmailAndPassword)
import Web.Firebase.Firestore.Auth.Type (UserInfo)
import Web.Firebase.Firestore.CollectionReference as Col
import Web.Firebase.Firestore.DocumentReference as Doc
import Web.Firebase.Firestore.DocumentSnapshot as SN

main :: Effect Unit
main = do
  launchAff_ $ do
    app ← initializeApp firebaseConfig
    au ← authWithApp {app : app}
    void $ onAuthStateChanged au showUser {}
    _ ← signInWithEmailAndPassword au {email : "email", password : "password"}

    writedb
    readdb

showUser ∷ Nullable UserInfo → Unit
showUser r = 
  case toMaybe r of
    Just (u ∷ UserInfo) → unsafePerformEffect do
      log u.displayName
      log u.email
    Nothing → unit

writedb ∷ Aff Unit
writedb =
  void $ do
    fs ← firestore
    co ← collection fs "sample"
    dc ← Col.doc co {path:"idqSW6F8ROuqgEA9d4du"}
  -- void $ liftEffect $ (runFn2 Fs._add) co (write myValue)
    Doc.set dc (write myValue) {}
  where
    myValue =
      { apple: "Hi"
      , banana: [ 1, 2, 3 ]
      } ∷ MyRecordAlias

readdb ∷ Aff Unit
readdb = 
  void do
    fs ← firestore
    dc ← doc fs "/sample/idqSW6F8ROuqgEA9d4du"
  -- liftEffect $ (Fs.add co ) >>= \q → log "done"
    sn ← Doc.get dc {}
    dt ← SN.snapshotdata sn {}
    liftEffect $ case read dt of
      Right (r ∷ MyRecordAlias) → log r.apple
      Left a → log "parse error"

type MyRecordAlias =
  { apple :: String
  , banana :: Array Int
  }
