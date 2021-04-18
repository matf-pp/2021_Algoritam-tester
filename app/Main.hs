module Main where

import Lib


main :: IO ()
main = do
--   sta zelis da kompiliras
--   ucitaj to sto zelis
    takeCodeName
    code <- getLine
--   argumenti komandne linije za kompilaciju
    takeArgs
    args <- getLine
--     KOMPILIRAJ
    ourCompile code args

-- pravi direktorijum "resenja"
    napraviDir "resenja"

    putStrLn $ "kompiliran je program" ++ code

    folderFiles <- filesInDir "test1"


    -- izvrsava nas kod onoliko puta koliko ima fajlova u folderu i upisuje izlaze u folder
    obavest ((length $ folderFiles) - 2)

    putStrLn "kraj"
    -- izvrsi komanda_poziva ((length $ folderFiles) - 2)
 

-- pozovi ovo primer: ./a.out 1.dat
-- ulaz: u 1_in.txt


-- main = do
    
--     navedi gde su testovi (podrazumevano u folderu test1)
--     izvrsi n gde je n broj fajlova u test1
--         izvrsi upisuje rezultate u folder out/1_out.txt itd...

--     ## ideja uraditi izvrsavanje u zasebnim nitima
--     ## problem razdvajanje argumenata komandne linije i ulaza za primer
--     ## ideja napraviti sa strane random generator za odredjeni domen koji zadajemo 



