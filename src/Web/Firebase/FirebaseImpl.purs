  module Web.Firebase.Impl where

-- https://firebase.google.com/docs/reference/js/firebase

import Prelude


import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Types (class FirebaseImplement, class ToJSON, class ToString, App, Auth, Database, Firebase, FirebaseConfig, Firestore, GithubAuthProvider, Storage, firebaseRef)


foreign import _initializeApp ∷ ∀ name. Fn3 Firebase FirebaseConfig name (Effect App)
initializeAppWithName ∷ ∀ a a' m.
    Row.Union a a' (name ∷ String)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ FirebaseConfig → {| a} → m App
initializeAppWithName a b = firebaseRef >>= \fb → liftEffect $ runFn3 _initializeApp fb a b

initializeApp ∷ ∀ m.
    MonadAff m
  ⇒ FirebaseImplement m
  ⇒ FirebaseConfig → m App
initializeApp conf = initializeAppWithName conf {}

foreign import _app ∷ ∀ opts. Fn2 Firebase opts (Effect App)
appWithApp ∷ ∀ opts a m.
    Row.Union opts a (name ∷ String)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ {| opts} → m App
appWithApp a = firebaseRef >>= \fb → liftEffect $ runFn2 _app fb a

app ∷ ∀ opts a m.
    Row.Union opts a (name ∷ String)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ m App
app = appWithApp {}

foreign import _auth ∷ ∀ opts. Fn2 Firebase opts (Effect Auth)
authWithApp ∷ ∀ opts a m.
    Row.Union opts a (app ∷ App)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ {| opts} → m Auth
authWithApp a = firebaseRef >>= \fb → liftEffect $ runFn2 _auth fb a

auth ∷ ∀ m.
    MonadAff m
  ⇒ FirebaseImplement m
  ⇒ m Auth
auth = authWithApp {}

foreign import githubAuthProviderImpl ∷ Fn1 Firebase (Effect GithubAuthProvider)
githubAuthProvider ∷ ∀ m.
    MonadAff m
  ⇒ FirebaseImplement m
  ⇒ m GithubAuthProvider
githubAuthProvider = firebaseRef >>= \fb → liftEffect $ runFn1 githubAuthProviderImpl fb

foreign import _database ∷ ∀ opts. Fn2 Firebase opts (Effect Database)
databaseWithApp ∷ ∀ opts a m.
    Row.Union opts a (app ∷ App)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ {| opts} → m Database
databaseWithApp a = firebaseRef >>= \fb → liftEffect $ runFn2 _database fb a

database ∷ ∀ m.
    MonadAff m
  ⇒ FirebaseImplement m
  ⇒ m Database
database = databaseWithApp {}

foreign import _firestore ∷ ∀ opts. Fn2 Firebase opts (Effect Firestore)
firesotreWithApp ∷ ∀ opts a m.
    Row.Union opts a (app ∷ App)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ {| opts} → m Firestore
firesotreWithApp a = firebaseRef >>= \fb → liftEffect $ runFn2 _firestore fb a

firestore  ∷ ∀ m.
    MonadAff m
  ⇒ FirebaseImplement m
  ⇒ m Firestore
firestore = firesotreWithApp {}

foreign import _storage ∷ ∀ opts. Fn2 Firebase opts (Effect Storage)
storage ∷ ∀ opts a m.
    Row.Union opts a (app ∷ App)
  ⇒ MonadAff m
  ⇒ FirebaseImplement m
  ⇒ {| opts} → m Storage
storage a = firebaseRef >>= \fb →  liftEffect $ runFn2 _storage fb a


-- Utility
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
