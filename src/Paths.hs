-- | Fake cabal module for local building

module Paths_js_flot(getDataFileName, version) where

import Data.Version
import System.Directory
import System.FilePath


getDataFileName :: FilePath -> IO FilePath
getDataFileName x = do
    dir <- getCurrentDirectory
    pure $ dir </> "javascript" </> x

version :: Version
version = Version [0,8,3] []
