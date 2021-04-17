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
    show (Ekst PythonFile)  = "py"
    show (Ekst CppFile)     = "cpp"


takeCodeName = putStrLn "Write a name of file you want to compile e.g. 1.c "
takeArgs = putStrLn "Write arguments you want to compile with (if you dont want just pres Enter) "


kompajlirajServerskiC code args = callCommand $ "gcc " ++ code ++ args
kompajlirajServerskiPython code args = callCommand $ "python3 " ++ code ++ args
kompajlirajServerskiCpp code args = callCommand $ "g++ " ++ code ++ args
kompajlirajServerskiHs code args = callCommand $ "ghc " ++ code ++ args

-- moze bolje
findExtension code = reverse $ takeWhile (/= '.') (reverse code) 

ourCompile code args = case (findExtension code) of
                        "c" -> kompajlirajServerskiC code args
                        "cpp" -> kompajlirajServerskiCpp code args
                        "py" -> kompajlirajServerskiPython code args
                        "hs" -> kompajlirajServerskiHs code args
                        

izvrsi n = izvrsavaj n 1
        where 
            izvrsavaj n k
                    | n == k = callCommand $ "./a.out < test1/" ++ rdbr ++  "_in.txt > " ++ rdbr ++ "_out.txt"
                    | n > k = do
                            callCommand $ "./a.out < test1/" ++ rdbr ++  "_in.txt > " ++ rdbr ++ "_out.txt"
                            izvrsavaj n (k+1)
                    where rdbr = show k

filesInDir = getDirectoryContents








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