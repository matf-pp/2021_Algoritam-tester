module Main where

import LibClient
import Data.List
import System.IO
import System.Process
import System.Directory
import Data.Hashable
import Data.Char
import Data.List.Split

main :: IO()
main = do
    -- server kompilira 
    putStrLn "Unesite ime fajla koji zelite da kompilirate "
    fileName <- getLine 

    -- ucitava komandu za kompiliranje i folder sa test primertima iz fajla config.txt
    handle <- openFile "config.txt" ReadMode
    contents <- hGetContents handle 
    let compilingCommand = (splitOn ":" contents) !! 0
    let testExamplesFolder =  (splitOn ":" contents) !! 1

    createDirectoryIfMissing False "outClient" 

--  KOMPILIRAJ
    exeCommand (compilingCommand ++ " " ++ fileName ++ " -o outClient/izvrsni")

    filesToExecuteWith <- filesInDir testExamplesFolder

    mapM_ (obradiClient testExamplesFolder) filesToExecuteWith

    mapM_ uporediFajlove filesToExecuteWith
    

    clearFilesWithPattern "izvrsni"
    removeDirectoryRecursive "outClient"

    putStrLn "kraj 2"