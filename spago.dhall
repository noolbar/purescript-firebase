{ sources =
    [ "src/**/*.purs" ]
, name =
    "firebase"
, packages =
    ./packages.dhall
, dependencies =
    [ "aff"
    , "aff-promise"
    , "affjax"
    , "console"
    , "foreign"
    , "foreign-generic"
    , "newtype"
    , "nullable"
    , "prelude"
    , "spec"
    , "transformers"
    ]
}
