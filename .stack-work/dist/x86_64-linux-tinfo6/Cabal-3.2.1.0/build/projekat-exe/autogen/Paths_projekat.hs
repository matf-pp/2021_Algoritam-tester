{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_projekat (
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

bindir     = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/bin"
libdir     = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/lib/x86_64-linux-ghc-8.10.4/projekat-0.1.0.0-4Y8fLXjGDQ85utVaRE3LMh-projekat-exe"
dynlibdir  = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/share/x86_64-linux-ghc-8.10.4/projekat-0.1.0.0"
libexecdir = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/libexec/x86_64-linux-ghc-8.10.4/projekat-0.1.0.0"
sysconfdir = "/home/user/Desktop/projekat/2021_Algoritam-tester/.stack-work/install/x86_64-linux-tinfo6/9e194b85368e95e3c7c002900f7322f5b31143796a8cf4fd63078fc058a82c87/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "projekat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projekat_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "projekat_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "projekat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projekat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projekat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
