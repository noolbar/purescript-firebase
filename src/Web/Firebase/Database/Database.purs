module Web.Firebase.Database where

import Prelude

import Affjax (URL)
import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3)
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Aff (Aff)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE2, runPromiseAffE3, runPromiseAffE4)
import Web.Firebase.Types (class Dblike, EventType,Document, Firebase, Key, FQuery,Database)


foreign import _goOffline ∷ Fn1 Database (Effect Unit)
goOffline ∷ Database → Effect Unit
goOffline = runFn1 _goOffline

foreign import _goOnline ∷ Fn1 Database (Effect Unit)
goOnline ∷ Database → Effect Unit
goOnline = runFn1 _goOnline

foreign import _ref ∷ ∀ path. Fn2 Database path (Effect Database)
ref ∷ ∀ path a. Row.Union path a (path :: String) ⇒ Database → {| path} → Effect Database
ref = runFn2 _ref

foreign import _refFromURL ∷ Fn2 Database URL (Effect Database)
refFromURL ∷ Database → URL → Effect Database
refFromURL = runFn2 _refFromURL

foreign import _child ∷ Fn2 Document String (Aff Document)
child ∷ Document → String → Aff Document
child = runFn2 _child

foreign import _endAt ∷ ∀ value opts. Fn3 Document value opts (Aff FQuery)
endAt ∷ ∀ value opts a. Row.Union opts a (key :: String) ⇒ Document → value → {| opts}→  Aff FQuery
endAt = runFn3 _endAt

foreign import _equalTo ∷ ∀ value opts. Fn3 Document value opts (Aff FQuery)
equalTo ∷ ∀ value opts a. Row.Union opts a (key :: String) ⇒ Document → value → {| opts} → Aff FQuery
equalTo = runFn3 _equalTo

foreign import _isEqual ∷ Fn2 Document FQuery (Aff Boolean)
isEqual ∷ Document → FQuery → Aff Boolean
isEqual = runFn2 _isEqual

foreign import _limitToFirst ∷ Fn2 Document Int (Aff FQuery)
limitToFirst ∷ Document → Int → Aff FQuery
limitToFirst = runFn2 _limitToFirst

foreign import _limitToLast ∷ Fn2 Document Int (Aff FQuery)
limitToLast ∷ Document → Int → Aff FQuery
limitToLast = runFn2 _limitToLast

foreign import _off ∷ ∀ opts. Fn2 Document opts (Aff Unit)
off ∷ ∀ opts a ds. Row.Union opts a (eventType ∷ EventType, callback ∷ (ds → Effect Unit), context ∷ Foreign)
  ⇒ Document → {| opts} → Aff Unit
off = runFn2 _off

foreign import _on ∷ ∀ opts ds. Fn4 Document EventType (ds → Effect Unit) opts (Effect (Promise Unit))
on ∷ ∀ opts a ds. Row.Union opts a (cancelCallbackOrContext ∷ Foreign, context ∷ Foreign)
  ⇒ Document → EventType → (ds → Effect Unit) → {| opts} → Aff Unit
on = runPromiseAffE4 _on

foreign import _onDisconnect ∷ Fn1 Document (Aff Document)
onDisconnect ∷ Document → Aff Document
onDisconnect = runFn1 _onDisconnect

foreign import _once ∷ ∀ opts. Fn3 Document EventType opts (Effect (Promise Unit))
once ∷ ∀ opts a ds. Row.Union opts a (callback ∷ (ds → Effect Unit), cancelCallbackOrContext ∷ Foreign, context ∷ Foreign)
  ⇒ Document → EventType → {| opts} → Aff Unit
once = runPromiseAffE3 _once

foreign import _orderByChild ∷ Fn2 Document String (Aff FQuery)
orderByChild ∷ Document → String → Aff FQuery
orderByChild = runFn2 _orderByChild

foreign import _orderByKey ∷ Fn1 Document (Aff FQuery)
orderByKey ∷ Document → Aff FQuery
orderByKey = runFn1 _orderByKey

foreign import _orderByPriority ∷ Fn1 Document (Aff FQuery)
orderByPriority ∷ Document → Aff FQuery
orderByPriority = runFn1 _orderByPriority

foreign import _orderByValue ∷ Fn1 Document (Aff FQuery)
orderByValue ∷ Document → Aff FQuery
orderByValue = runFn1 _orderByValue

foreign import _push ∷ ∀ opts. Fn2 Document opts (Aff Document)
push ∷ ∀ opts a any ds. Row.Union opts a (value ∷ any, onComplete ∷ (ds → Effect Unit)) ⇒ Document → {| opts} → Aff Document
push = runFn2 _push

foreign import _remove ∷ ∀ opts. Fn2 Document opts (Effect (Promise Unit))
remove ∷ ∀ opts a ds. Row.Union opts a (onComplete ∷ (ds → Effect Unit))
  ⇒ Document → {| opts} → Aff Unit
remove = runPromiseAffE2 _remove

foreign import _set ∷ ∀ opts. Fn3 Document Foreign opts (Effect (Promise Unit))
set ∷ ∀ opts a ds. Row.Union opts a (onComplete ∷ (ds → Effect Unit)) ⇒ Document → Foreign → {| opts} → Aff Unit
set = runPromiseAffE3 _set

foreign import _setPriority ∷ ∀ priority ds. Fn3 Document priority (ds → Effect Unit) (Effect (Promise Unit))
setPriority ∷ ∀ priority ds. Document → priority → (ds → Effect Unit) → Aff Unit
setPriority = runPromiseAffE3 _setPriority

foreign import _setWithPriority ∷ ∀ newVal newPriority opts. Fn4 Document newVal newPriority opts (Effect (Promise Unit))
setWithPriority ∷ ∀ opts a newVal newPriority ds. Row.Union opts a (onComplete ∷ (ds → Effect Unit))
  ⇒ Document → newVal → newPriority → {| opts} → Aff Unit
setWithPriority = runPromiseAffE4 _setWithPriority

foreign import _startAt ∷ ∀ value opts. Fn3 Document value opts (Aff FQuery)
startAt ∷ ∀ value opts a. Row.Union opts a (key :: String) ⇒ Document → value → {| opts} → Aff FQuery
startAt = runFn3 _startAt

foreign import _transaction ∷ ∀ opts transactionUpdate. Fn3 Document transactionUpdate opts (Effect (Promise Unit))
transaction ∷ ∀ opts a transactionUpdate ds. Row.Union opts a (onComplete ∷ (ds → Effect Unit), applyLocally ∷ Boolean)
  ⇒ Document → transactionUpdate → {| opts} → Aff Unit
transaction = runPromiseAffE3 _transaction

foreign import _update ∷ ∀ value opts. Fn3 Document value opts (Effect (Promise Unit))
update ∷ ∀ value opts a ds. Row.Union opts a (onComplete ∷ (ds → Effect Unit))
  ⇒ Document → value → {| opts} → Aff Unit
update = runPromiseAffE3 _update





-- | Gets the key of the reference - https://firebase.google.com/docs/reference/js/firebase.database.DataSnapshot.html#key
-- Nothing on the root ref (following the behaviour in the Firebase API)
foreign import key ∷ Firebase → Maybe Key


foreign import rootRefFor ∷ ∀ a. Dblike a ⇒ a → Effect Firebase

