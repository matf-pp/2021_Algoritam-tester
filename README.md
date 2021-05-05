# Algoritam tester

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2d3253183a5d430984e986d2718e4fb3)](https://app.codacy.com/gh/matf-pp/2021_Algoritam-tester?utm_source=github.com&utm_medium=referral&utm_content=matf-pp/2021_Algoritam-tester&utm_campaign=Badge_Grade_Settings)

## Opis

Tester za ispite i kolokvijume. Pomoću programa moguće je uporediti i proveriti rešenja zadataka i na osnovu različitih test primera videti koliko bodova je student osvojio na ispitu(kolokvijumu). Ceo program pisan je u jeziku Haskell i namenjen je za bilo koji operativni sistem pod uslovom da su instalirani svi paketi potrebni za Haskell.


## Način pokretanja
    1. Skinuti repozitorijum komandom:
            git clone https://github.com/matf-pp/2021_Algoritam-tester.git
            promenite trenutni direktorijum
            cd 2021_Algoritam-tester

    2. Instalacija:
        U terminalu pokrenuti komandu:
            curl -sSL https://get.haskellstack.org/ | sh

    3. Pokretanja programa:
        Kao serverska strana:
            a) U trenutni direktorijum iskopirati folder sa test primerima i zeljeni C Fajl koji zelite da kompilirate
            b) Pokrenuti program komandom: stack ghci
            c) Otvara se haskell interpreter u kom pokrecete komandu: main
            d) Pratite uputstva
        Kao klijentska strana nastavlja komandom:
            a) U trenutni direktorijum premestiti zeljeni fajl koji zelite da testirate
            b) Pokrenuti program komandom: stack ghci
            c) Otvara se haskell interpreter u kom pokrecete komandu: mainClient
            d) Pratite uputstva


## Podaci o autorima

Nikola Borjan 010/2018
Marko Bura 141/2018
