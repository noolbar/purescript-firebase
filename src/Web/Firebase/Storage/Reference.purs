module Web.Firebase.Storage.Reference where
-- https://firebase.google.com/docs/reference/js/firebase.storage.Reference

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Web.Firebase.Aff (runPromiseAffE1, runPromiseAffE2)
import Web.Firebase.Storage.Type (ListResult, Reference, UploadTask)

foreign import _child ∷ Fn2 Reference String (Effect Reference)
child ∷ Reference → String → Aff Reference
child a b = liftEffect $ runFn2 _child a b

foreign import _delete ∷ Fn1 Reference (Effect (Promise Foreign))
delete ∷ Reference  → Aff Foreign
delete a = runPromiseAffE1 _delete a

foreign import _getDownloadURL ∷ Fn1 Reference (Effect (Promise Foreign))
getDownloadURL ∷ Reference  → Aff Foreign
getDownloadURL a = runPromiseAffE1 _getDownloadURL a

foreign import _getMetadata ∷ Fn1 Reference (Effect (Promise Foreign))
getMetadata ∷ Reference → Aff Foreign
getMetadata a = runPromiseAffE1 _getMetadata a

foreign import _list ∷ ∀ opts. Fn2 Reference opts (Effect (Promise ListResult))
list ∷ ∀ opts. Reference → { | opts} → Aff ListResult
list a b = runPromiseAffE2 _list a b

foreign import _listAll ∷ Fn1 Reference (Effect (Promise ListResult))
listAll ∷ Reference → Aff ListResult
listAll a = runPromiseAffE1 _listAll a

foreign import _put ∷ ∀ opts. Fn3 Reference String opts (Effect UploadTask)
put ∷ ∀ opts.  Reference → String → {| opts} → Aff UploadTask
put a b c = liftEffect $ runFn3 _put a b c

foreign import _putString ∷ ∀ opts. Fn3 Reference String opts (Effect Reference)
putString ∷ ∀ opts. Reference → String → {| opts} → Aff Reference
putString a b c = liftEffect $ runFn3 _putString a b c

foreign import _toString ∷ Fn1 Reference (Effect String)
toString ∷ Reference → Aff String
toString a = liftEffect $ runFn1 _toString a

foreign import _updateMetadata ∷ Fn2 Reference String (Effect (Promise ListResult))
updateMetadata ∷ Reference → String → Aff ListResult
updateMetadata a b = runPromiseAffE2 _updateMetadata a b
