module Web.Firebase.Firestore.DocumentSnapshot where

-- https://firebase.google.com/docs/reference/js/firebase.firestore.DocumentSnapshot
import Prelude

import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Types (class Multipath, DocumentSnapshot, SnapshotOption)


foreign import _snapshotdata ∷ ∀ opts. Fn2 DocumentSnapshot opts (Effect Foreign)
snapshotdata ∷ ∀ opts a. Row.Union opts a (options ∷ SnapshotOption) ⇒ DocumentSnapshot → {| opts} → Aff Foreign
snapshotdata a b = liftEffect $ runFn2 _snapshotdata a b

foreign import _get ∷ ∀ path opts. Fn3 DocumentSnapshot path opts (Effect Foreign)
get ∷ ∀ path opts a. Row.Union opts a (options ∷ SnapshotOption)
  ⇒ Multipath path
  ⇒ DocumentSnapshot → path → {| opts} → Aff Foreign
get a b c = liftEffect $ runFn3 _get a b c

foreign import _isEqual ∷ Fn2 DocumentSnapshot DocumentSnapshot (Effect Boolean)
isEqual ∷ DocumentSnapshot → DocumentSnapshot → (Aff Boolean)
isEqual a b = liftEffect $ runFn2 _isEqual a b
