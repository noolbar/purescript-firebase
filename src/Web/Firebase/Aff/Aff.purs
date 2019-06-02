-- Reference
-- https://github.com/justinwoo/purescript-toppokki/blob/master/src/Toppoki.purs
-- https://github.com/justinwoo/purescript-node-sqlite3/blob/master/src/SQLite3.purs

module Web.Firebase.Aff
-- ( authWithCustomToken
-- )
where

import Prelude

import Control.Promise (Promise)
import Control.Promise as Promise
import Data.Function.Uncurried (Fn1, Fn2, Fn3, Fn4, runFn1, runFn2, runFn3, runFn4)
import Effect (Effect)
import Effect.Aff (Aff)

-- authWithCustomToken ∷ String →
--                        Auth →
--                        Aff Foreign
-- authWithCustomToken token ref = makeAff (\errorCb successCb → AE.authWithCustomToken token successCb (convertError errorCb) ref)

runPromiseAffE1 ∷ forall a o. Fn1 a (Effect (Promise o)) → a → Aff o
runPromiseAffE1 f a = Promise.toAffE $ runFn1 f a

runPromiseAffE2 ∷ forall a b o. Fn2 a b (Effect (Promise o)) → a → b → Aff o
runPromiseAffE2 f a b = Promise.toAffE $ runFn2 f a b

runPromiseAffE3 ∷ forall a b c o. Fn3 a b c (Effect (Promise o)) → a → b → c → Aff o
runPromiseAffE3 f a b c = Promise.toAffE $ runFn3 f a b c

runPromiseAffE4 ∷ forall a b c d o. Fn4 a b c d (Effect (Promise o)) → a → b → c → d → Aff o
runPromiseAffE4 f a b c d = Promise.toAffE $ runFn4 f a b c d

