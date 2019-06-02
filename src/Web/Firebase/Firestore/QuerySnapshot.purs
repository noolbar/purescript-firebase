module Web.Firebase.Firestore.QuerySnapshot where

-- https://firebase.google.com/docs/reference/js/firebase.firestore.QueryDocumentSnapshot

import Prelude

import Data.Function.Uncurried (Fn3, runFn3)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Prim.Row (class Union)
import Web.Firebase.Types (QueryDocumentSnapshot, QuerySnapshot)

foreign import _forEach ∷ ∀ func opts. Fn3 QuerySnapshot func opts (Effect Unit)
forEach ∷ ∀ opts a args. Union opts a (args ∷ args) ⇒ QuerySnapshot → (QueryDocumentSnapshot → Unit) → {| opts} → Aff Unit
forEach q a b = liftEffect $ runFn3 _forEach q a b
