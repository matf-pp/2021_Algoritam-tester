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
    putStrLn "Napisite komandu kojom kompilirate npr: 'gcc -Wall'"
    compilingCommand <- getLine

    putStrLn "Unesite ime programa koji zelite da kompilirate npr: '1.c '"
    fileName <- getLine 

-- upisati u fajl config.txt komandu za kompiliranje i folder gde su testovi
    putStrLn "Unesite ime relativnu putanju foldera u kome su test primeri npr: 'test1' "
    testExamplesFolder <- getLine

    createDirectoryIfMissing False "out" 
--  KOMPILIRAJ
    exeCommand (compilingCommand ++" "++ fileName ++ " -o out/izvrsni")


    filesToExecuteWith <- filesInDir testExamplesFolder
    print (length filesToExecuteWith)


    writeFile "config.txt" (compilingCommand ++ ":" ++ testExamplesFolder)

-- izvrsi program za svaki fajl iz foldera sa test primerima 
    mapM (obradiServer testExamplesFolder) filesToExecuteWith


    clearFilesWithPattern "izvrsni"

    putStrLn "kraj"



-- TODO napraviti fajl config.txt koji ce da cuva nacin kompiliranja i izvrsavanja,
-- imena foldera sa testovima, imena izlaznih itd..

