# Algoritam tester

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2d3253183a5d430984e986d2718e4fb3)](https://app.codacy.com/gh/matf-pp/2021_Algoritam-tester?utm_source=github.com&utm_medium=referral&utm_content=matf-pp/2021_Algoritam-tester&utm_campaign=Badge_Grade_Settings)

## Opis

Tester za ispite i kolokvijume. Pomoću programa moguće je uporediti i proveriti rešenja zadataka i na osnovu različitih test primera videti koliko bodova je student osvojio na ispitu(kolokvijumu). Ceo program pisan je u jeziku Haskell i namenjen je za bilo koji operativni sistem pod uslovom da su instalirani svi paketi potrebni za Haskell.


## Način pokretanja
    1. Na githubu otvoriti releases i skinuti zipovane fajlove client.zip i server.zip

    2. Kada uspešno skinete prethodno navedene fajlove njih treba otpakovati komandom unzip

    3. Pozicionirati se u terminalu u folder gde su otpakovani fajlovi i pratiti sledece komande:
        Asistent(server):
            - pokreće aplikaciju komandom ./server
            - prati upustva tako što prvo unosi komandu kojom će kompajlirati fajl,
                zatim ime fajla, pa nakon toga folder u kome se nalaze ulazi za zadati program ako postoje
            - program će napraviti izlaze koji će se dalje uporedjivati sa izlazima studentskih programa
            
        Student(client):
            - pokreće aplikaciju komandom ./client
            - zadaje ime fajla koji želi da proveri
            - program izbacuje za koje test primere se izlaz poklapa sa zadatim a za koje ne


## Podaci o autorima

Nikola Borjan 010/2018
Marko Bura 141/2018
