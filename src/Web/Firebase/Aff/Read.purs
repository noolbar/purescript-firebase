module Web.Firebase.Aff.Read
-- ( onceValue
-- , valueAt
-- )
where

import Prelude

-- import Control.Monad.Error.Class (throwError)
-- import Effect.Aff (Aff)
-- import Effect.Exception (error)
-- import Foreign (Foreign)
-- import Web.Firebase as FB
-- import Web.Firebase.Aff (once)
-- import Web.Firebase.DataSnapshot (val)
-- import Web.Firebase.Types as FBT

-- -- | Inspired by its Eff relative.
-- -- | Throw takes a message and throws a MonadError in Aff with that message
-- -- TODO move to its own module, also used by 'regular' Aff module
-- throw ∷ forall a. String → Aff a
-- throw = throwError <<< error

-- valueAt ∷ FBT.Firebase → Foreign
-- valueAt ref = do
--        snap <- onceValue ref
--        pure $ (val snap)

-- onceValue ∷ FBT.Firebase → FBT.DataSnapshot
-- onceValue root = once FB.Value root

