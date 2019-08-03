module Web.Firebase.Impl where

-- https://firebase.google.com/docs/reference/js/firebase

import Prelude

import Data.Function.Uncurried (Fn0, Fn1, Fn2, runFn0, runFn1, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Types (class ToJSON, class ToString, App, Auth, Database, Firebase, FirebaseConfig, Firestore, GithubAuthProvider, Storage)


foreign import _initializeApp ∷ ∀ name. Fn2 FirebaseConfig name (Effect App)
initializeAppWithName ∷ ∀ a a'. Row.Union a a' (name ∷ String) ⇒ FirebaseConfig → {| a} → Aff App
initializeAppWithName a b = liftEffect $ runFn2 _initializeApp a b

initializeApp ∷ FirebaseConfig → Aff App
initializeApp conf = initializeAppWithName conf {}

foreign import _app ∷ ∀ opts. Fn1 opts (Effect App)
appWithApp ∷ ∀ opts a. Row.Union opts a (name ∷ String) ⇒ {| opts} → Aff App
appWithApp a = liftEffect $ runFn1 _app a

app ∷ Aff App
app = appWithApp {}

foreign import _auth ∷ ∀ opts. Fn1 opts (Effect Auth)
authWithApp ∷ ∀ opts a. Row.Union opts a (app ∷ App) ⇒ {| opts} → Aff Auth
authWithApp a = liftEffect $ runFn1 _auth a

auth ∷ Aff Auth
auth = authWithApp {}

foreign import githubAuthProviderImpl ∷ GithubAuthProvider

foreign import _database ∷ ∀ opts. Fn1 opts (Effect Database)
databaseWithApp ∷ ∀ opts a. Row.Union opts a (app ∷ App) ⇒ {| opts} → Aff Database
databaseWithApp a = liftEffect $ runFn1 _database a

database ∷ Aff Database
database = databaseWithApp {}

foreign import _firestore ∷ ∀ opts. Fn1 opts (Effect Firestore)
firesotreWithApp ∷ ∀ opts a. Row.Union opts a (app ∷ App) ⇒ {| opts} → Aff Firestore
firesotreWithApp a = liftEffect $ runFn1 _firestore a

firestore ∷ Aff Firestore
firestore = firesotreWithApp {}

foreign import _storage ∷ ∀ opts. Fn1 opts (Effect Storage)
storage ∷ ∀ opts a. Row.Union opts a (app ∷ App) ⇒ {| opts} → Aff Storage
storage a = liftEffect $ runFn1 _storage a


-- Utility
foreign import firebaseRef ∷ Firebase

foreign import _toJSON ∷ ∀ a. ToJSON a ⇒ a → Effect Foreign
toJSON ∷ ∀ a. ToJSON a ⇒ a → Aff Foreign
toJSON a = liftEffect $ runFn1 _toJSON a

foreign import _toString ∷ ∀ a. ToString a ⇒ a → Effect String
toString ∷ ∀ a. ToString a ⇒ a → Aff String
toString a = liftEffect $ runFn1 _toString a

-- Callback receives Maybe on the outside, Nullable on the inside
callBackReceivesNull ∷ ∀ a b. (Maybe a → b) → (Nullable a → b)
callBackReceivesNull cb = nab where
  nab nullValue = cb (toMaybe nullValue)

noOpCallBack ∷ ∀ a. a → Effect Unit
noOpCallBack _ = pure unit
