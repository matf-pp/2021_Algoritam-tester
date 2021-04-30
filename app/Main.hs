module Main where


import Data.List
import System.IO
import Lib
import System.Process
import System.Directory

main :: IO ()
main = do

    takeCompilingCommand
    compilingCommand <- getLine
--  KOMPILIRAJ
    exeCommand compilingCommand

    takeFolderName
    folderName <- getLine

-- fajlovi iz foldera 
    filesToExecuteWith <- filesInDir folderName

    createDirectoryIfMissing False "resenja" 

-- mapiranje funkcije 
    mapM (obradi1 folderName) filesToExecuteWith



      




    -- (_, Just so, _, ph1)  <- createProcess (proc "ls" []) { std_out = CreatePipe } 
    -- (_, _, _, ph2) <- createProcess (proc "sort" []) { std_in = UseHandle so }
    -- waitForProcess ph1
    -- waitForProcess ph2



    putStrLn "kraj"
 


