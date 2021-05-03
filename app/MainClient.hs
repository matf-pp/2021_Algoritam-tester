module MainClient where

import Lib
import Data.List
import System.IO
import System.Process
import System.Directory
import Data.Hashable
import Data.Char
import Data.List.Split


-- rawCompare a b = do
--     aContents <- readFile a
--     bContents <- readFile b
--     return (aContents == bContents)


isEmpty string = all isSpace string

hashNiz a = sum
    $ zipWith (*) [1..(length a)]
    $ map hash a

linijeFajla f = do
    sadrzaj <- readFile f
    return (fmap (filter (\x -> not (isEmpty x)))lines sadrzaj)

reciFajla f = fmap (words) (f)

obradiClient testFilesFolder file1 = do
        let pathIn = testFilesFolder ++ "/" ++ file1
        let pathOut = "outClient/out_" ++ file1
        finHandle <- openFile pathIn ReadMode 
        foutHandle <- openFile pathOut WriteMode 
        (_, _, _, ph1) <- createProcess (proc "outClient/izvrsni" []) { std_in = UseHandle finHandle,
                                                                std_out = UseHandle  foutHandle  }
        waitForProcess ph1
        -- hGetContents out >>= print


mainClient :: IO()
mainClient = do
    -- server kompilira 
    putStrLn "Unesite ime fajla koji zelite da kompilirate "
    fileName <- getLine 

    handle <- openFile "config.txt" ReadMode
    contents <- hGetContents handle 
    let compilingCommand = (splitOn ":" contents) !! 0
    let testExamplesFolder =  (splitOn ":" contents) !! 1

    createDirectoryIfMissing False "outClient" 

--  KOMPILIRAJ
    exeCommand (compilingCommand ++ " " ++ fileName ++ " -o outClient/izvrsni")

    filesToExecuteWith <- filesInDir testExamplesFolder

    mapM (obradiClient testExamplesFolder) filesToExecuteWith



    clearFilesWithPattern "izvrsni"

    putStrLn "kraj 2"