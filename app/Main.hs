module Main where

import Lib


main :: IO ()
main = do
--   sta zelis da kompiliras
--   ucitaj to sto zelis
    takeCodeName
    kod <- getLine
--   argumenti komandne linije za kompilaciju
    takeArgs
    args <- getLine
--     KOMPILIRAJ
    ourCompile kod args

    -- putStrLn "Testovi su u folderu test1"
    napraviDir
    
    putStrLn $ "pokrecem program " ++ kod

    folderFiles <- filesInDir "test1"
    -- izvrsava nas kod onoliko puta koliko ima fajlova u folderu i upisuje izlaze u folder
    izvrsi ((length $ folderFiles) - 2)
 



-- main = do
    
--     navedi gde su testovi (podrazumevano u folderu test1)
--     izvrsi n gde je n broj fajlova u test1
--         izvrsi upisuje rezultate u folder out/1_out.txt itd...

--     ## ideja uraditi izvrsavanje u zasebnim nitima
--     ## problem razdvajanje argumenata komandne linije i ulaza za primer
--     ## ideja napraviti sa strane random generator za odredjeni domen koji zadajemo 



