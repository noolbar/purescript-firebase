module Web.Firebase.Firestore.CollectionReference where

-- https://firebase.google.com/docs/reference/js/firebase.firestore.CollectionReference
import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE2)
import Web.Firebase.Types (Collection, Document)


foreign import _add ∷ Fn2 Collection Foreign (Effect (Promise Document))
add ∷ Collection → Foreign → Aff Document
add a b = runPromiseAffE2 _add a b

foreign import _doc ∷ ∀ opts. Fn2 Collection opts (Effect Document)
doc ∷ ∀ opts a. Row.Union opts a (path ∷ String) ⇒ Collection → {| opts} → Aff Document
doc q a = liftEffect $ runFn2 _doc q a
