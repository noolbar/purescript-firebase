module Web.Firebase.Storage where
-- https://firebase.google.com/docs/reference/js/firebase.storage.Storage

import Prelude

import Control.Monad.Reader (class MonadAsk, asks)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Web.Firebase.Storage.Type (Reference)
import Web.Firebase.Types (Storage)

foreign import _ref ∷ ∀ opts. Fn2 Storage opts (Effect Reference)
ref ∷ ∀ m r.
    MonadAff m
  ⇒ MonadAsk { storage ∷ Storage | r } m
  ⇒ String
  → m Reference
ref a = do
  storage ← asks _.storage
  liftEffect $ runFn2 _ref storage a

foreign import _refFromURL ∷ Fn2 Storage String (Effect Reference)
refFromURL ∷ ∀ m r.
    MonadAff m
  ⇒ MonadAsk { storage ∷ Storage | r } m
  ⇒ String
  → m Reference
refFromURL a = do
  storage ← asks _.storage
  liftEffect $ runFn2 _refFromURL storage a

foreign import _setMaxOperationRetryTime ∷ Fn2 Storage Number (Effect Foreign)
setMaxOperationRetryTime ∷ ∀ m r.
    MonadAff m
  ⇒ MonadAsk { storage ∷ Storage | r } m
  ⇒ Number
  → m Foreign
setMaxOperationRetryTime a = do
  storage ← asks _.storage
  liftEffect $runFn2 _setMaxOperationRetryTime storage a

foreign import _setMaxUploadRetryTime ∷ Fn2 Storage Number (Effect Foreign)
setMaxUploadRetryTime ∷ ∀ m r.
    MonadAff m
  ⇒ MonadAsk { storage ∷ Storage | r } m
  ⇒ Number
  → m Foreign
setMaxUploadRetryTime a = do
  storage ← asks _.storage
  liftEffect $ runFn2 _setMaxUploadRetryTime storage a
