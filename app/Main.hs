module Main where

import Lib
import Data.List
import System.IO
import System.Process
import System.Directory
import Data.Hashable

main :: IO ()
main = do

-- server kompilira 
    putStrLn "Napisite komandu kojom kompilirate npr: 'gcc'"
    compilingCommand <- getLine

    putStrLn "Unesite ime programa koji zelite da kompilirate npr: '1.c '"
    fileName <- getLine 

-- upisivanje u fajl config.txt komandu za kompiliranje i folder gde su testovi
    putStrLn "Unesite relativnu putanju foldera u kome su test primeri npr: 'test1' "
    testExamplesFolder <- getLine

    createDirectoryIfMissing False "out" 
--  KOMPILIRAJ
    exeCommand (compilingCommand ++" "++ fileName ++ " -o out/izvrsni")

-- niz IO fajlova iz zadatog test foldera
    filesToExecuteWith <- filesInDir testExamplesFolder

-- upisivanje svega potrebnog u fajl 'config.txt'
    writeFile "config.txt" (compilingCommand ++ ":" ++ testExamplesFolder)

-- izvrsi program za svaki fajl iz foldera sa test primerima 
    mapM (obradiServer testExamplesFolder) filesToExecuteWith


    clearFilesWithPattern "izvrsni"

    putStrLn "kraj"
