module Web.Firebase.Database.DataSnapshot
  ( child
  , exists
  , hasChild
  , hasChildren
  , key
  , numChildren
  , val
  )
  where

import Data.Function.Uncurried (Fn2, runFn1, runFn2)
import Data.Maybe (Maybe)
import Effect (Effect)
import Foreign (Foreign)
import Web.Firebase.Types (class DataSnapshot, Key)

-- | Returns a child snapshot of the current snapshot
-- https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot#child
foreign import _child ∷ ∀ ds. DataSnapshot ds ⇒ Fn2 ds String ds
child ∷ ∀ ds. DataSnapshot ds ⇒ ds → String → ds
child = runFn2 _child

-- | Returns true if this DataSnapshot contains any data.
-- https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot#exists
foreign import _exists ∷ ∀ ds. DataSnapshot ds ⇒ ds → Effect Boolean
exists ∷ ∀ ds. DataSnapshot ds ⇒ ds → Effect Boolean
exists = runFn1 _exists

-- | Returns true if the specified child exists
-- https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot#has-child
foreign import _hasChild ∷ ∀ ds. DataSnapshot ds ⇒ ds → Effect Boolean
hasChild ∷ ∀ ds. DataSnapshot ds ⇒ ds → Effect Boolean
hasChild = runFn1 _hasChild

-- | Returns true if the DataSnapshot has children
-- https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot#has-children
foreign import _hasChildren ∷ ∀ ds. DataSnapshot ds ⇒ ds → Boolean
hasChildren ∷ ∀ ds. DataSnapshot ds ⇒ ds → Boolean
hasChildren = runFn1 _hasChildren

-- | Returns the number of children
-- You'll only find out if it exists if you call functions on it. See e.g. val and hasChild
-- https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot#num-children
foreign import _numChildren ∷ ∀ ds. DataSnapshot ds ⇒ ds → Int
numChildren ∷ ∀ ds. DataSnapshot ds ⇒ ds → Int
numChildren = runFn1 _numChildren

-- | Gets the JavaScript object representation of the DataSnapshot.
-- val can be null if the snapshot is empty or does not exist
foreign import _val ∷ ∀ ds. DataSnapshot ds ⇒ ds → Foreign
val ∷ ∀ ds. DataSnapshot ds ⇒ ds → Foreign
val = runFn1 _val

-- | Gets the key of the location that generated the DataSnapshot
foreign import _key ∷ ∀ ds. DataSnapshot ds ⇒ ds → Maybe Key
key ∷ ∀ ds. DataSnapshot ds ⇒ ds → Maybe Key
key = runFn1 _key
