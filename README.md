# js-flot [![Hackage version](https://img.shields.io/hackage/v/js-flot.svg?label=Hackage)](https://hackage.haskell.org/package/js-flot) [![Stackage version](https://www.stackage.org/package/js-flot/badge/nightly?label=Stackage)](https://www.stackage.org/package/js-flot) [![Build Status](https://img.shields.io/travis/ndmitchell/js-flot/master.svg)](https://travis-ci.org/ndmitchell/js-flot)

This package bundles the minified [Flot](http://www.flotcharts.org/) code
(a jQuery plotting library) into a Haskell package,
so it can be depended upon by Cabal packages. The first three components of
the version number match the upstream Flot version. The package is designed
to meet the redistribution requirements of downstream users (e.g. Debian).
As an example:

```haskell
import qualified Language.Javascript.Flot as Flot

main = do
    putStrLn $ "Flot version " ++ show Flot.version ++ " source:"
    putStrLn =<< readFile =<< Flot.file Flot.Flot
```

Note that Flot depends on jQuery, a Haskell version of which can be obtained
from the [`js-jquery` package](https://github.com/ndmitchell/js-jquery#readme).

This package installs data files containing the Flot sources, which must be available at runtime. If you want to produce an executable with no dependency on associated data files, you can use the [`file-embed`](https://hackage.haskell.org/package/file-embed) library:

```haskell
{-# LANGUAGE TemplateHaskell #-}

import Data.FileEmbed
import qualified Data.ByteString as BS
import qualified Language.Javascript.Flot as Flot
import Language.Haskell.TH.Syntax

main = print flotContents

flotContents :: BS.ByteString
flotContents = $(embedFile =<< runIO (Flot.file Flot.Flot))
```
