module Web.Firebase.Firestore where

-- https://firebase.google.com/docs/reference/js/firebase.firestore
-- https://firebase.google.com/docs/reference/js/firebase.firestore.Firestore.html

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE1, runPromiseAffE2)
import Web.Firebase.Types (Collection, Document, FQuery, Firestore, GetOptions, PersistenceSettings, Settings, WriteBatch)


foreign import _getOptions ∷ Fn1 Firestore GetOptions
getOptions ∷ Firestore → GetOptions
getOptions = runFn1 _getOptions

foreign import _merge ∷ Fn2 Firestore String (Effect Unit)
merge ∷ Firestore → String → Effect Unit
merge = runFn2 _merge

foreign import _mergeFields ∷ Fn2 Firestore String (Effect Unit)
mergeFields ∷ Firestore → String → Effect Unit
mergeFields = runFn2 _mergeFields

foreign import _setLogLevel ∷ Fn2 Firestore Int (Effect Unit)
setLogLevel ∷ Firestore → Int → Effect Unit
setLogLevel = runFn2 _setLogLevel

-- firebase. firestore. Blob


-- firebase.firestore.Firestore
foreign import _batch ∷ Fn1 Firestore (Effect WriteBatch)
batch ∷ Firestore → Aff WriteBatch
batch a = liftEffect $ runFn1 _batch a

foreign import _clearPersistence ∷ Fn1 Firestore (Effect (Promise Unit))
clearPersistence ∷ Firestore → Aff Unit
clearPersistence a = runPromiseAffE1 _clearPersistence a

foreign import _collection ∷ Fn2 Firestore String (Effect Collection)
collection ∷ Firestore → String → Aff Collection
collection a b = liftEffect $ runFn2 _collection a b

foreign import _collectionGroup ∷ Fn2 Firestore String (Effect FQuery)
collectionGroup ∷ Firestore → String → Aff FQuery
collectionGroup a b = liftEffect $ runFn2 _collectionGroup a b

foreign import _disableNetwork ∷ Fn1 Firestore (Effect (Promise Unit))
disableNetwork∷ Firestore → Aff Unit
disableNetwork= runPromiseAffE1 _disableNetwork

foreign import _doc ∷ Fn2 Firestore String (Effect Document)
doc ∷ Firestore → String → Aff Document
doc a b = liftEffect $ runFn2 _doc a b

foreign import _enableNetwork ∷ Fn1 Firestore (Effect (Promise Unit))
enableNetwork ∷ Firestore → Aff Unit
enableNetwork = runPromiseAffE1 _enableNetwork

foreign import _enablePersistence ∷ ∀ opts. Fn2 Firestore opts (Effect (Promise Unit))
enablePersistence ∷ ∀ opts a. Row.Union opts a (settings ∷ PersistenceSettings) ⇒ Firestore → {| opts} → Aff Unit
enablePersistence = runPromiseAffE2  _enablePersistence

foreign import _runTransaction ∷ ∀ func a. Fn2 Firestore func (Effect (Promise a))
runTransaction ∷ ∀ func a. Firestore → func → Aff a
runTransaction a b = runPromiseAffE2 _runTransaction a b

foreign import _settings ∷ Fn2 Firestore Settings (Effect Unit)
settings ∷ Firestore → Settings → Aff Unit
settings a b = liftEffect $ runFn2 _settings a b
