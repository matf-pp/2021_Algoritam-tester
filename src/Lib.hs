module Lib where

import System.IO
import System.Process
import System.Directory
                     
exeCommand command = callCommand $ command
isRegularFile f = f /= "." && f /= ".." 

filesInDir dirName = do
                        files <- getDirectoryContents dirName
                        return (filter isRegularFile files)

obradiServer testFilesFolder file1 = do
        let pathIn = testFilesFolder ++ "/" ++ file1
        let pathOut = "out/out_" ++ file1
        finHandle <- openFile pathIn ReadMode 
        foutHandle <- openFile pathOut WriteMode
        (_,_, _, ph1) <- createProcess (proc "out/izvrsni" []) { std_in = UseHandle finHandle,
                                                                        std_out = UseHandle foutHandle  }
                                                                
        waitForProcess ph1
        -- hGetContents out >>= print


clearFilesWithPattern pattern = callCommand $ "find . -name '" ++ pattern ++ "' -delete"
clearOutFiles = clearFilesWithPattern "out_*"





