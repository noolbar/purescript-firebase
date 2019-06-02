module Web.Firebase.Firestore.Auth.Type where


import Prelude

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe)


-- | convert authdata (from twitter and google to start with) to a purescript authdata record
-- sample data at https://boiling-heat-7831.firebaseapp.com/authspike.html
-- Maybe we should use an extensible record with an alternative parser, that parses UserCredentials + google/twitter etc
-- because now users have to include all providers in their source, even when they use only one.
newtype UserCredentials = UserCredentials {
    provider ∷ String
  , uid ∷ String
  , token ∷ String
  , google ∷ Maybe GoogleProfile
  }

-- ProviderUserProfile = TwitterProfile TwitterProfileRecord | GoogleProfile GoogleProfileRecord | etc

derive instance genericUserCredentials ∷ Generic UserCredentials _
derive instance eqUserCredentials ∷ Eq UserCredentials

instance showUserCredentials ∷ Show UserCredentials where
  show = genericShow



newtype GoogleProfile = GoogleProfile {
    displayName ∷ String
  , id ∷ String
  , email ∷ Maybe String -- email is optional depending on permissions and account type
  , profileImageURL ∷ String
  }

-- ProviderUserProfile = TwitterProfile TwitterProfileRecord | GoogleProfile GoogleProfileRecord | etc

data AuthenticationStatus = LoggedOut | LoggedIn GoogleProfile -- | LoggedIn GoogleProfile ProviderUserProfile

derive instance genericGoogleProfile ∷ Generic GoogleProfile _
derive instance eqGoogleProfile ∷ Eq GoogleProfile

instance showGoogleProfile ∷ Show GoogleProfile where
  show = genericShow


type UserInfo =
 { displayName ∷ String
 , email ∷ String
 , emailVerified ∷ String
 , photoURL ∷ String
 , isAnonymous ∷ String
 , uid ∷ String
 , providerData ∷ String
 }
