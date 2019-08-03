module Web.Firebase.Auth.GithubAuthProvider where

-- https://firebase.google.com/docs/reference/js/firebase.auth.GithubAuthProvider.html

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Types (Auth, GithubAuthProvider, OAuthCredential)


foreign import _addScope ∷ Fn2 GithubAuthProvider String (Effect GithubAuthProvider)
addScope ∷ GithubAuthProvider → String → Aff GithubAuthProvider
addScope a b = liftEffect $ runFn2 _addScope a b

foreign import _setCustomParameters ∷ Fn2 GithubAuthProvider Foreign (Effect GithubAuthProvider)
setCustomParameters ∷ GithubAuthProvider → Foreign → Aff GithubAuthProvider
setCustomParameters a b = liftEffect $ runFn2 _setCustomParameters a b

foreign import _credential ∷ Fn2 GithubAuthProvider String (Effect OAuthCredential)
credential ∷ GithubAuthProvider → String → Aff OAuthCredential
credential a b = liftEffect $ runFn2 _credential a b
