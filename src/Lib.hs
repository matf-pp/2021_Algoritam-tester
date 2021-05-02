module Lib where

import System.IO
import System.Process
import System.Directory

takeFileName = putStrLn "What is the name of file you want check?"
takeCompilingCommand = putStrLn "Write a command you want to compile and execute"
takeFolderName = putStrLn "Where are test examples for your code"                        

exeCommand command = callCommand $ command
isRegularFile f = f /= "." && f /= ".." 

filesInDir dirName = do
                        files <- getDirectoryContents dirName
                        return (filter isRegularFile files)

obradi1 folderName file1 = do
        let pathIn = folderName ++ "/" ++ file1
        let pathOut = "out/out_" ++ file1
        finHandle <- openFile pathIn ReadMode 
        foutHandle <- openFile pathOut WriteMode
        (_, _, _, ph1) <- createProcess (proc "out/izvrsni" []) { std_in = UseHandle finHandle,
                                                                std_out = UseHandle foutHandle }
        waitForProcess ph1

clearFilesWithPattern pattern = callCommand $ "find . -name '" ++ pattern ++ "' -delete"
clearOutFiles = clearFilesWithPattern "out_*"





