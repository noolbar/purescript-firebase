{ sources =
    [ "src/**/*.purs" ]
, name =
    "firebase"
, packages =
    ./packages.dhall
, dependencies =
    [ "prelude"
    , "aff"
    , "aff-promise"
    , "affjax"
    , "console"
    , "foreign"
    , "foreign-generic"
    , "nullable"
    , "spec"
    , "transformers"
    ]
}
