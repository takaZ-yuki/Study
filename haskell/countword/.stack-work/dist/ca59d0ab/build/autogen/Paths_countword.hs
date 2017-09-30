{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_countword (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\bin"
libdir     = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2\\countword-0.1.0.0-7ZQ7JUBRJgX9OSj6zOS53B"
dynlibdir  = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\share\\x86_64-windows-ghc-8.0.2\\countword-0.1.0.0"
libexecdir = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\libexec"
sysconfdir = "C:\\work\\git\\Study\\haskell\\countword\\.stack-work\\install\\ed14a2f4\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "countword_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "countword_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "countword_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "countword_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "countword_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "countword_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
