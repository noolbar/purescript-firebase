module Web.Firebase.Auth.GithubAuthProvider where

-- https://firebase.google.com/docs/reference/js/firebase.auth.GithubAuthProvider.html

import Prelude

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Web.Firebase.Types (GithubAuthProvider, OAuthCredential)


foreign import _addScope ∷ Fn2 GithubAuthProvider String (Effect GithubAuthProvider)
addScope ∷ GithubAuthProvider → String → Aff GithubAuthProvider
addScope a b = liftEffect $ runFn2 _addScope a b

foreign import _setCustomParameters ∷ Fn2 GithubAuthProvider Foreign (Effect GithubAuthProvider)
setCustomParameters ∷ GithubAuthProvider → Foreign → Aff GithubAuthProvider
setCustomParameters a b = liftEffect $ runFn2 _setCustomParameters a b

foreign import _credential ∷ Fn2 GithubAuthProvider String (Effect OAuthCredential)
credential ∷ GithubAuthProvider → String → Aff OAuthCredential
credential a b = liftEffect $ runFn2 _credential a b
