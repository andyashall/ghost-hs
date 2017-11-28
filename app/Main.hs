module Main where

import Data.List (isPrefixOf)

-- What should be passed to game? new char to be added 
type Game = (String, [String], Int, Int, Int)

-- Need to import a list of words 

-- Start game -> select n of players -> take turns entering a char -> if loose +1 to lossing player

main :: IO ()
main = do
  let words = ["test","word"]
  let word = ""
  game (word, words, 0, 0, 0)

game :: Game -> IO ()
game (word, words, p1, p2, turn) = do
  let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  if p1 == 5
    then putStrLn "Player 2 wins"
    else if p2 == 5
      then putStrLn "Player 1 wins"
      else do 
        putStrLn $ "Player 1: " ++ id (show p1)
        putStrLn $ "Player 2: " ++ id (show p2)
        putStrLn $ "Current word: " ++ id (show word)
        char <- getLine
        if check char letters
          then do
            if check (word ++ char) words
              then do
                putStrLn $ id (show (word ++ char)) ++ " is a word"
                if turn == 0 then game ("", words, (p1+1), p2, 1) else game ("", words, p1, (p2+1), 0)
              else do
                if (or (checkStartOfWord (word ++ char) words))
                  then game ((word ++ char), words, p1, p2, 1)
                  else do
                    putStrLn $ id (show (word ++ char)) ++ " is not start of word"
                    if turn == 0 then game ("", words, (p1+1), p2, 1) else game ("", words, p1, (p2+1), 0)
          else do
            putStrLn "Invalid input"
            game (word, words, p1, p2, turn)


-- Could be used to also check if a word is in a list
check :: String -> [String] -> Bool
check x l 
  | x `elem` l = True
  | otherwise = False

checkStartOfWord :: String -> [String] -> [Bool]
checkStartOfWord x l = map (isPrefixOf x) l

-- addChar
