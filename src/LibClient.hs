module LibClient where

import System.IO
import System.Process
import System.Directory
import System.IO
import Data.List
import Data.Hashable
import Data.Char
import Data.List.Split
                     
trim xs = dropSpaceTail "" $ dropWhile isSpace xs
dropSpaceTail maybeStuff "" = ""
dropSpaceTail maybeStuff (x:xs)
        | isSpace x = dropSpaceTail (x:maybeStuff) xs
        | null maybeStuff = x : dropSpaceTail "" xs
        | otherwise       = reverse maybeStuff ++ x : dropSpaceTail "" xs

exeCommand command = callCommand $ command
isRegularFile f = f /= "." && f /= ".." 

filesInDir dirName = do
                        files <- getDirectoryContents dirName
                        return (filter isRegularFile files)


obradiClient testFilesFolder file1 = do
        let pathIn = testFilesFolder ++ "/" ++ file1
        let pathOut = "outClient/out_" ++ file1
        finHandle <- openFile pathIn ReadMode 
        foutHandle <- openFile pathOut WriteMode 
        (_, _, _, ph1) <- createProcess (proc "outClient/izvrsni" []) { std_in = UseHandle finHandle,
                                                                std_out = UseHandle  foutHandle  }
        waitForProcess ph1

uporediFajlove fajl = do
    let pathIn = "out/out_" ++ fajl
    let pathOut = "outClient/out_" ++ fajl
    handleOut <- openFile pathOut ReadMode
    handleIn <- openFile pathIn ReadMode 
    sadrzajIn <- hGetContents handleIn
    sadrzajOut <- hGetContents handleOut

    let x = hashNiz $ (words . trim) sadrzajIn
    let y = hashNiz $ (words . trim) sadrzajOut

    if (x == y)
        then print $ "test primer je tacan za fajl " ++ fajl
        else print $ "test primer NIJE tacan za fajl " ++ fajl


    

hashNiz a = sum
    $ zipWith (*) [1..(length a)]
    $ map hash a




clearFilesWithPattern pattern = callCommand $ "find . -name '" ++ pattern ++ "' -delete"
clearOutFiles = clearFilesWithPattern "out_*"





