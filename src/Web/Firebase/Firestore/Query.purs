module Web.Firebse.Firestore.Query where

-- https://firebase.google.com/docs/reference/js/firebase.firestore.Query
import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3, runFn4)
import Effect (Effect)
import Effect.Aff (Aff)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE2)
import Web.Firebase.Types (class FirestoreQuery, class Multipath, DocumentSnapshot, FQuery, GetOptions, OrderByDirection, QuerySnapshot, WhereFilterOp)


foreign import _endAt ∷ ∀ q. Fn2 q DocumentSnapshot FQuery
endAt ∷ ∀ q. FirestoreQuery q ⇒ q → DocumentSnapshot → FQuery
endAt q a = runFn2 _endAt q a

foreign import _endBefore ∷ ∀ q. Fn2 q DocumentSnapshot FQuery
endBefore ∷ ∀ q. FirestoreQuery q ⇒ q → DocumentSnapshot → FQuery
endBefore q a = runFn2 _endBefore q a

foreign import _get ∷ ∀ q opts. Fn2 q opts (Effect (Promise QuerySnapshot))
get ∷ ∀ q opts a. FirestoreQuery q ⇒ Row.Union opts a (options ∷ GetOptions) ⇒ q → {| opts} → Aff QuerySnapshot
get q a = runPromiseAffE2 _get q a

foreign import _isEqual ∷ ∀ q. Fn1 q (Effect Boolean)
isEqual ∷ ∀ q. FirestoreQuery q ⇒ q → Effect Boolean
isEqual q = runFn1 _isEqual q

foreign import _limit ∷ ∀ q. Fn2 q Int FQuery
limit ∷ ∀ q. FirestoreQuery q ⇒ q → Int → FQuery
limit q a = runFn2 _limit q a

foreign import _onSnapshot ∷ ∀ q. Fn2 q Foreign (Effect Unit)
onSnapshot ∷ ∀ q. FirestoreQuery q ⇒ q → Foreign → Effect Unit
onSnapshot q a = runFn2 _onSnapshot q a

foreign import _orderBy ∷ ∀ q path. Fn3 q path OrderByDirection (Effect Unit)
orderBy ∷ ∀ q path. FirestoreQuery q ⇒ Multipath path ⇒ q → path → OrderByDirection → Effect Unit
orderBy q a b = runFn3 _orderBy  q a b

foreign import _startAfter ∷ ∀ q. Fn1 q FQuery
startAfter ∷ ∀ q. FirestoreQuery q ⇒ q → FQuery
startAfter q = runFn1 _startAfter q

foreign import _startAt ∷ ∀ q. Fn1 q FQuery
startAt ∷ ∀ q. FirestoreQuery q ⇒ q → FQuery
startAt q = runFn1 _startAt q
-- where
foreign import _querywithfilter ∷ ∀ q path. Fn4 q path WhereFilterOp Foreign FQuery
querywithfilter ∷ ∀ q path. FirestoreQuery q ⇒ Multipath path ⇒ q → path → WhereFilterOp → Foreign → FQuery
querywithfilter q a b c = runFn4 _querywithfilter q a b c
