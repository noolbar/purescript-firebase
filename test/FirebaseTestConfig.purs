module FirebaseTestConfig (firebaseConfig) where

-- generated from https://console.firebase.google.com/u/0/project/purescript-spike/overview
import Web.Firebase.Types (FirebaseConfig, mkFirebaseConfig)

firebaseConfig ::  FirebaseConfig
firebaseConfig = mkFirebaseConfig {
    apiKey: "<apiKey>"
  , appId: "<appId>"
  , authDomain: "<authDomain>"
  , databaseURL: "<databaseURL>"
  , messagingSenderId: "<id>"
  , projectId: "<pro>"
  , storageBucket: "<storageBucket>"
  }
