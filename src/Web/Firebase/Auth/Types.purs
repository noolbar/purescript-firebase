module Web.Firebase.Auth.Type where


import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Foreign (F, Foreign, readNull)
import Foreign.Generic (decode)
import Foreign.Index (readProp)


-- | convert authdata (from twitter and google to start with) to a purescript authdata record
-- sample data at https://boiling-heat-7831.firebaseapp.com/authspike.html
-- Maybe we should use an extensible record with an alternative parser, that parses UserCredentials + google/twitter etc
-- because now users have to include all providers in their source, even when they use only one.
type UserCredentialsbase a b =
  ( additionalUserInfo ∷ Maybe { | AdditionalUserInfoRep a}
  , credential ∷ { | AuthCredentialRep b}
  , operationType ∷ Maybe String
  , user ∷ User
  )

type AdditionalUserInfoRep r =
  ( isNewUser ∷ Boolean
  , profile ∷ Foreign
  , providerId ∷ String
  , username ∷ Maybe String
  | r
  )

type AuthCredentialRep r =
  ( providerId ∷ String
  , signInMethod ∷ String
  | r
  )

type User =
  { displayName ∷ String
  , email ∷ String
  , phoneNumber ∷ Maybe String -- sometime null
  , photoURL ∷ String
  , providerId ∷ String
  , uid ∷ String --The user's unique ID.
  }

data UserCredentials = UserCredential { | UserCredentialsbase () () }
                     | GithubUserCredential { | UserCredentialsbase () (accessToken ∷ String) }
-- derive instance newtypeUserCredentials ∷ Newtype UserCredentials _
-- derive instance genericUserCredentials ∷ Generic UserCredentials _
-- -- derive instance eqUserCredentials ∷ Eq UserCredentials

-- instance showUserCredentials ∷ Show UserCredentials where
--   show a = show "UserCredentials"

-- newtype GithubUserCredentials = GithubUserCredentials { | UserCredentialsbase () (accessToken ∷ String) }
-- derive instance newtypeGithubUserCredentials ∷ Newtype GithubUserCredentials _
-- type GithubAuthCredentialRep = (AdditionalUserInfoRep (accessToken ∷ String))

readGithubUserCredential ∷ Foreign → F (Maybe UserCredentials)
readGithubUserCredential value = do
  emp ← readProp "user" value >>= \x → readNull x
  pure $ case emp of
    Just y →
      case runExcept $ decode value of
        Right (u ∷ { | UserCredentialsbase () (accessToken ∷ String) }) → Just $ GithubUserCredential u
        Left e → Nothing
    Nothing → Nothing

readAccessToken ∷ Foreign → F (Maybe String)
readAccessToken value = do
  user ← readProp "user" value >>= \x → readNull x
  pure $ case user of
    Just _ →
      case runExcept $ decode value of
        Right (u ∷ { | UserCredentialsbase () (accessToken ∷ String) }) → Just u.credential.accessToken
        Left e → Nothing
    Nothing → Nothing


type UserInfo =
  { displayName ∷ String
  , email ∷ String
  , emailVerified ∷ String
  , photoURL ∷ String
  , isAnonymous ∷ String
  , uid ∷ String
  , providerData ∷ String
  }

-- ProviderUserProfile = TwitterProfile TwitterProfileRecord | GoogleProfile GoogleProfileRecord | etc

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

