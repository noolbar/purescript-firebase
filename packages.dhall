
let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.6-20200507/packages.dhall sha256:9c1e8951e721b79de1de551f31ecb5a339e82bbd43300eb5ccfb1bf8cf7bbd62

let overrides =
      { halogen = upstream.halogen // { version = "v5.0.0-rc.4" }
      , halogen-vdom = upstream.halogen-vdom // { version = "v6.1.0" }
      , remotedata = upstream.remotedata // { version = "v4.2.0" }
      }

let overrides = {=}

let additions = {=}

in  upstream // overrides // additions
