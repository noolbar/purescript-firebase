module Web.Firebase.Database.OnDisconnect where

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE2)
import Web.Firebase.Types (Database)

foreign import _cancel ∷ ∀ opts. Fn2 Database opts (Effect (Promise Unit))
cancel ∷ ∀ opts a arg. Row.Union opts a (onComplete ∷ (arg → Effect Unit))
  ⇒ Database → {| opts} → Aff Unit
cancel = runPromiseAffE2 _cancel

foreign import _remove ∷ ∀ opts. Fn2 Database opts (Effect (Promise Unit))
remove ∷ ∀ opts a arg. Row.Union opts a (onComplete ∷ (arg → Effect Unit))
  ⇒ Database → {| opts} → Aff Unit
remove = runPromiseAffE2 _remove

foreign import _set ∷ ∀ opts. Fn2 Database opts (Effect (Promise Unit))
set ∷ ∀ opts a any arg. Row.Union opts a (value ∷ any, onComplete ∷ (arg → Effect Unit))
  ⇒ Database → {| opts} → Aff Unit
set = runPromiseAffE2 _set

foreign import _setWithPriority ∷ ∀ opts. Fn2 Database opts (Effect (Promise Unit))
setWithPriority ∷ ∀ opts a any1 any2 arg.
    Row.Union opts a (value ∷ any1, priority ∷ any2, onComplete ∷ (arg → Effect Unit))
  ⇒ Database → {| opts} → Aff Unit
setWithPriority = runPromiseAffE2 _setWithPriority

foreign import _update ∷ ∀ opts. Fn2 Database opts (Effect (Promise Unit))
updata ∷ ∀ opts a any arg. Row.Union opts a (value ∷ any, onComplete ∷ (arg → Effect Unit))
  ⇒ Database → {| opts} → Aff Unit
updata = runPromiseAffE2 _update
