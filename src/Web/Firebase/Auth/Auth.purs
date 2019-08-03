module Web.Firebase.Auth where

-- https://firebase.google.com/docs/reference/js/firebase.auth.Auth

import Prelude

import Control.Promise (Promise)
import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Foreign (Foreign)
import Prim.Row as Row
import Web.Firebase.Aff (runPromiseAffE1, runPromiseAffE2, runPromiseAffE3)
import Web.Firebase.Types (Auth, Unsubscribe)


foreign import _applyActionCode ∷ Fn2 Auth String (Effect (Promise Unit))
applyActionCode ∷ Auth → String → Aff Unit
applyActionCode q a = runPromiseAffE2 _applyActionCode q a

foreign import data ActionCodeInfo ∷ Type
foreign import _checkActionCode ∷ Fn2 Auth String (Effect (Promise ActionCodeInfo))
checkActionCode ∷ Auth → String → Aff ActionCodeInfo
checkActionCode q a = runPromiseAffE2 _checkActionCode q a

foreign import _confirmPasswordReset ∷ Fn3 Auth String String (Effect (Promise Unit))
confirmPasswordReset ∷ Auth → String → String → Aff Unit
confirmPasswordReset q a b = runPromiseAffE3 _confirmPasswordReset q a b

foreign import _createUserWithEmailAndPassword ∷ Fn3 Auth String String (Effect (Promise Foreign))
createUserWithEmailAndPassword ∷ Auth → String → String → Aff Foreign
createUserWithEmailAndPassword q a b = runPromiseAffE3 _createUserWithEmailAndPassword q a b

foreign import _fetchSignInMethodsForEmail ∷ Fn2 Auth String (Effect (Promise (Array String)))
fetchSignInMethodsForEmail ∷ Auth → String → Aff (Array String)
fetchSignInMethodsForEmail q a = runPromiseAffE2 _fetchSignInMethodsForEmail q a

foreign import _getRedirectResult ∷ Fn1 Auth (Effect (Promise Foreign))
getRedirectResult ∷ Auth → Aff Foreign
getRedirectResult q = runPromiseAffE1 _getRedirectResult q

foreign import _isSignInWithEmailLink ∷ Fn2 Auth String (Effect Boolean)
isSignInWithEmailLink ∷ Auth → String → Aff Boolean
isSignInWithEmailLink q a = liftEffect $ runFn2 _isSignInWithEmailLink q a

foreign import _onAuthStateChanged ∷ ∀ next opts. Fn3 Auth next opts (Effect Unsubscribe)
onAuthStateChanged ∷ ∀ next opts a func1.
    Row.Union opts a (error ∷ func1, completed ∷ Unsubscribe)
  ⇒ Auth → next → {| opts} → Aff Unsubscribe
onAuthStateChanged q a b = liftEffect $ runFn3 _onAuthStateChanged q a b

foreign import _onIdTokenChanged ∷ ∀ next opts. Fn3 Auth next opts (Effect Unsubscribe)
onIdTokenChanged ∷ ∀  next opts a func1.
    Row.Union opts a (error ∷ func1, completed ∷ Unsubscribe)
  ⇒ Auth → next → {| opts} → Aff Unsubscribe
onIdTokenChanged q a b = liftEffect $ runFn3 _onIdTokenChanged q a b

foreign import data ActionCodeSettings ∷ Type
foreign import _sendPasswordResetEmail ∷ ∀ opts. Fn3 Auth String opts (Effect (Promise Unit))
sendPasswordResetEmail ∷ ∀ opts a.
    Row.Union opts a (actionCodeSettings ∷ ActionCodeSettings)
  ⇒ Auth → String → {| opts} → Aff Unit
sendPasswordResetEmail q a b = runPromiseAffE3 _sendPasswordResetEmail q a b

foreign import _sendSignInLinkToEmail ∷ ∀ opts. Fn3 Auth String opts (Effect (Promise Unit))
sendSignInLinkToEmail ∷ ∀ opts a.
    Row.Union opts a (actionCodeSettings ∷ ActionCodeSettings)
  ⇒ Auth → String → {| opts} → Aff Unit
sendSignInLinkToEmail q a b = runPromiseAffE3 _sendSignInLinkToEmail q a b

foreign import data Persistence ∷ Type
foreign import _setPersistence ∷ Fn2 Auth Persistence (Effect (Promise Unit))
setPersistence ∷ Auth → Persistence → Aff Unit
setPersistence q a = runPromiseAffE2 _setPersistence q a

-- foreign import _signInAndRetrieveDataWithCredential ∷ Fn2 Auth AuthCredential (Effect (Promise Foreign))
-- signInAndRetrieveDataWithCredential ∷ Auth → AuthCredential → Aff Foreign
-- signInAndRetrieveDataWithCredential q a b = runPromiseAffE2 _signInAndRetrieveDataWithCredential q a b

foreign import _signInAnonymously ∷ Fn1 Auth (Effect Foreign)
signInAnonymously ∷ Auth → Aff Foreign
signInAnonymously q = liftEffect $ runFn1 _signInAnonymously q

foreign import data AuthCredential ∷ Type
foreign import _signInWithCredential ∷ Fn2 Auth AuthCredential (Effect (Promise Foreign))
signInWithCredential ∷ Auth → AuthCredential → Aff Foreign
signInWithCredential q a = runPromiseAffE2 _signInWithCredential q a

foreign import _signInWithCustomToken ∷ Fn2 Auth String (Effect (Promise Foreign))
signInWithCustomToken ∷ Auth → String → Aff Foreign
signInWithCustomToken q a = runPromiseAffE2 _signInWithCustomToken q a

foreign import _signInWithEmailAndPassword ∷ ∀ opts. Fn2 Auth opts (Effect (Promise Foreign))
signInWithEmailAndPassword ∷ ∀ opts a. Row.Union opts a (email ∷ String, password ∷ String) ⇒ Auth → {| opts} → Aff Foreign
signInWithEmailAndPassword q a = runPromiseAffE2 _signInWithEmailAndPassword q a

foreign import _signInWithEmailLink ∷ ∀ opts. Fn3 Auth String opts (Effect (Promise Foreign))
signInWithEmailLink ∷ ∀ opts a. Row.Union opts a (emailLink ∷ String) ⇒ Auth → String → {| opts} → Aff Foreign
signInWithEmailLink q a b = runPromiseAffE3 _signInWithEmailLink q a b


foreign import data ApplicationVerifier ∷ Type
foreign import data ConfirmationResult ∷ Type
foreign import _signInWithPhoneNumber ∷ Fn3 Auth String ApplicationVerifier (Effect (Promise ConfirmationResult))
signInWithPhoneNumber ∷ Auth → String → ApplicationVerifier → Aff ConfirmationResult
signInWithPhoneNumber q a b = runPromiseAffE3 _signInWithPhoneNumber q a b

foreign import data AuthProvider ∷ Type
foreign import _signInWithPopup ∷ Fn2 Auth AuthProvider (Effect (Promise Foreign))
signInWithPopup ∷ Auth → AuthProvider → Aff Foreign
signInWithPopup q a = runPromiseAffE2 _signInWithPopup q a

foreign import _signInWithRedirect ∷ Fn2 Auth AuthProvider (Effect (Promise Unit))
signInWithRedirect ∷ Auth → AuthProvider → Aff Unit
signInWithRedirect q a = runPromiseAffE2 _signInWithRedirect q a

foreign import _signOut ∷ Fn1 Auth (Effect (Promise Unit))
signOut ∷ Auth → Aff Unit
signOut q = runPromiseAffE1 _signOut q

foreign import data User ∷ Type
foreign import _updateCurrentUser ∷ ∀ user. Fn2 Auth user (Effect (Promise Unit))
updateCurrentUser ∷ Auth → User → Aff Unit
updateCurrentUser q a = runPromiseAffE2 _updateCurrentUser q a

foreign import _useDeviceLanguage ∷ Fn1 Auth (Effect Unit)
useDeviceLanguage ∷ Auth → Aff Unit
useDeviceLanguage q = liftEffect $ runFn1 _useDeviceLanguage q

foreign import _verifyPasswordResetCode ∷ Fn2 Auth String (Effect (Promise Unit))
verifyPasswordResetCode ∷ Auth → String → Aff Unit
verifyPasswordResetCode q a = runPromiseAffE2 _verifyPasswordResetCode q a
