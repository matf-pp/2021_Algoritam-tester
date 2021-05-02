module Main where


import Lib
import Data.List
import System.IO
import System.Process
import System.Directory

main :: IO ()
main = do

-- server kompilira 
    takeCompilingCommand
    compilingCommand <- getLine
    

    createDirectoryIfMissing False "out" 

--  KOMPILIRAJ
    exeCommand (compilingCommand ++ " -o out/izvrsni")

    takeFolderName
    folderName <- getLine

    filesToExecuteWith <- filesInDir folderName

-- izvrsi program za svaki fajl iz foldera sa test primerima 
    mapM (obradi1 folderName) filesToExecuteWith

    clearFilesWithPattern "izvrsni"

    putStrLn "kraj"



-- TODO napraviti fajl config.txt koji ce da cuva nacin kompiliranja i izvrsavanja,
-- imena foldera sa testovima, imena izlaznih itd..

