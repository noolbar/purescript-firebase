module Web.Firebase.Firestore.DocumentReference where

-- https://firebase.google.com/docs/reference/js/firebase.firestore.DocumentReference
import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE1, runPromiseAffE2, runPromiseAffE3)
import Web.Firebase.Types (Collection, Document, DocumentSnapshot, GetOptions, SetOptions)


foreign import _collection ∷ Fn2 Document String (Effect Collection)
collection ∷ Document → String → Aff Collection
collection a b = liftEffect $ runFn2 _collection a b

foreign import _delete ∷ Fn1 Document (Effect (Promise Unit))
delete ∷ Document → Aff Unit
delete a = runPromiseAffE1 _delete a

foreign import _get ∷ ∀ opts. Fn2 Document opts (Effect (Promise DocumentSnapshot))
get ∷ ∀ opts a. Row.Union opts a (options ∷ GetOptions) ⇒ Document → {| opts} → Aff DocumentSnapshot
get a b = runPromiseAffE2 _get a b

foreign import _isEqual ∷ Fn2 Document Document (Effect Boolean)
isEqual ∷ Document → Document → Aff Boolean
isEqual a b = liftEffect $ runFn2 _isEqual a b

foreign import _onSnapshot ∷ ∀ func. Fn2 Document Foreign (Effect func)
onSnapshot ∷ ∀ func. Document → Foreign → Aff func
onSnapshot a b = liftEffect $ runFn2 _onSnapshot a b

foreign import _set ∷ ∀ ops. Fn3 Document Foreign ops (Effect (Promise Unit))
set ∷ ∀ opts a. Row.Union opts a (options ∷ SetOptions)
  ⇒ Document → Foreign → {| opts} → Aff Unit
set a b c = runPromiseAffE3 _set a b c

foreign import _update ∷ Fn2 Document Foreign (Effect (Promise Unit))
update ∷ Document → Foreign → Aff Unit
update a b = runPromiseAffE2 _update a b
