module Main where

import Data.List (isPrefixOf, intersperse)

-- What should be passed to game? new char to be added 
type Game = (String, Int, Int, Int)

-- Need to import a list of words http://norvig.com/ngrams/enable1.txt

-- Start game -> select n of players -> take turns entering a char -> if loose +1 to lossing player

main :: IO ()
main = do
  let word = ""
  game (word, 0, 0, 0)

game :: Game -> IO ()
game (word, p1, p2, turn) = do
  if p1 == 5
    then putStrLn "Player 2 wins"
    else if p2 == 5
      then putStrLn "Player 1 wins"
      else do 
        putStrLn $ "Player 1: " ++ id (show p1)
        putStrLn $ "Player 2: " ++ id (show p2)
        putStrLn $ "Current word: " ++ id (show word)
        if turn == 0 then putStrLn "Player 1 turn" else putStrLn "Player 2 turn"
        char <- getLine
        if checkChar char
          then do
            words <- fmap lines (readFile "words.txt")
            -- putStrLn $ id (show [(concat ["[", intersperse ',' (map (read::String->Char) words), "]"])])
            putStrLn $ id (show (map (read::String->[Char]) words))
            if (word ++ char) `elem` [(concat ["[", intersperse ',' (map (read::String->Char) words), "]"])]
              then do
                putStrLn $ id (show (word ++ char)) ++ " is a word"
                if turn == 0 then game ("", (p1+1), p2, 1) else game ("", p1, (p2+1), 0)
              else do
                if (or (checkStartOfWord (word ++ char)))
                  then if turn == 0 then game ((word ++ char), p1, p2, 1) else game ((word ++ char), p1, p2, 0)
                  else do
                    putStrLn $ id (show (word ++ char)) ++ " is not the start of a word"
                    if turn == 0 then game ("", (p1+1), p2, 1) else game ("", p1, (p2+1), 0)
          else do
            putStrLn "Invalid input"
            game (word, p1, p2, turn)

-- Could be used to also check if a word is in a list
checkChar :: String -> Bool
checkChar x = x `elem` ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

-- checkWord :: String -> Bool
-- checkWord x = x `elem` ["test", "word"]

-- checkWord :: String -> IO Bool
-- checkWord x = do
--   words <- fmap lines (readFile "words.txt")
--   x `elem` words

checkStartOfWord :: String -> [Bool]
checkStartOfWord x = map (isPrefixOf x) ["test","word"]

-- addChar
