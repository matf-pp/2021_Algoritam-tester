module Lib where


import System.Process
import System.Directory


data TipFajla =  CFile
               | PythonFile
               | CppFile
               | HaskellFile
               deriving (Show)

-- Ekst je konstruktor 5_58.hs 
data Ekstenzija = Ekst TipFajla

instance Show Ekstenzija where
    show (Ekst CFile)       = "c"
    show (Ekst HaskellFile) = "hs"
    show (Ekst CppFile)     = "cpp"


takeCodeName = putStrLn "Write a name of file you want to compile e.g. 1.c "
takeArgs = putStrLn "Write arguments you want to compile with (if you dont want just pres Enter) "


kompajlirajServerskiC code args = callCommand $ "gcc " ++ code ++ args
kompajlirajServerskiCpp code args = callCommand $ "g++ " ++ code ++ args
kompajlirajServerskiHs code args = callCommand $ "ghc " ++ code ++ args

-- moze bolje
findExtension code = reverse $ takeWhile (/= '.') (reverse code) 

ourCompile code args = case (findExtension code) of
                        "c" -> kompajlirajServerskiC code args
                        "cpp" -> kompajlirajServerskiCpp code args
                        "hs" -> kompajlirajServerskiHs code args
                        
napraviDir name = createDirectoryIfMissing False name

obavest n = obavesti n 1
             where obavesti n k
                        | n == k = do
                                funkcija                                 
                        | otherwise = do
                                funkcija
                                obavesti n (k+1)
                        where
                                funkcija = do
                                        putStrLn $ "navedite komandu poziva za " ++ (show k) ++ "_in.txt"
                                        x <- getLine
                                        callCommand $ x ++ "< test1/" ++ (show k) ++  "_in.txt > resenja/" ++ (show k) ++ "_out.txt"    



izvrsi n = izvrsavaj n 1
        where 
            izvrsavaj n k
                    | n == k = callCommand $ "./a.out  < test1/" ++ rdbr ++  "_in.txt > resenja/" ++ rdbr ++ "_out.txt"
                    | n > k = do
                            callCommand $ "./a.out < test1/" ++ rdbr ++  "_in.txt > resenja/" ++ rdbr ++ "_out.txt"
                            izvrsavaj n (k+1)
                    where 
                        rdbr = show k
                --         argumenti_poziva =  do
                --                                 content <- readFile ("1_in.txt")
                --                                 linesOfFiles <- lines content



filesInDir dir = getDirectoryContents dir

someFunc = putStrLn "someFunc"

-- main :: IO ()
-- main = do
--   args <- getArgs
--   case args of
--     fname:_ -> do
--       print $ "working with " ++ fname
--       finHandle <- openFile fname ReadMode
--       hDuplicateTo finHandle stdin
--       foutHandle <- openFile (fname ++ ".out") WriteMode
--       hDuplicateTo foutHandle stdout
--     [] -> do
--       print "working through stdin/redirect"
--   interact ((++) "Here you go---\n" . map toUpper)



-- https://hackage.haskell.org/package/process-1.0.1.3/docs/System-Process.html