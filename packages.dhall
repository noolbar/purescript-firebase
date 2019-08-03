let mkPackage =
      https://raw.githubusercontent.com/purescript/package-sets/psc-0.12.5-20190427/src/mkPackage.dhall sha256:0b197efa1d397ace6eb46b243ff2d73a3da5638d8d0ac8473e8e4a8fc528cf57

let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.2-20190725/packages.dhall sha256:60cc03d2c3a99a0e5eeebb16a22aac219fa76fe6a1686e8c2bd7a11872527ea3

let overrides =
      { halogen =
          upstream.halogen // { version = "v5.0.0-rc.4" }
      , halogen-vdom =
          upstream.halogen-vdom // { version = "v6.1.0" }
      , remotedata =
          upstream.remotedata // { version = "v4.2.0" }
      }

in  upstream // overrides
