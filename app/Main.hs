module Main where


import Data.List
import System.IO
import Lib
import System.Process

main :: IO ()
main = do

-- server kompilira 
    takeCompilingCommand
    compilingCommand <- getLine
--  KOMPILIRAJ
    exeCommand compilingCommand

    takeFolderName
    folderName <- getLine

-- fajlovi iz foldera 
    filesToExecuteWith <- filesInDir folderName
    let duzinaNiza = length filesToExecuteWith

    print $ [0..duzinaNiza-1]

-- mapiranje funkcije 
    mapM (obradi1 folderName) filesToExecuteWith

    putStrLn "kraj"


--TODO:
-- dati vecu slobodu serverskoj strani da moze da zadaje koji fajlovi se izvrsavaju itd


