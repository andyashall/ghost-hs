module Main where

import Data.List (isPrefixOf)

-- What should be passed to game? new char to be added 
type Game = (String, [String])

-- Need to import a list of words 

-- Start game -> select n of players -> take turns entering a char -> if loose +1 to lossing player

main :: IO ()
main = do
  let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  let words = ["test","word"]
  char <- getLine
  if checkChar char letters
    then do
      word <- getLine
      if (or (checkStartOfWord word words))
        then do
          putStrLn "Legit"
          if checkChar word words
            then putStrLn "is a word"
            else putStrLn "not a word"
        else putStrLn "Not start of word"
    else putStrLn "Invalid input"

-- game :: IO ()
-- game = do

-- Could be used to also check if a word is in a list
checkChar :: String -> [String] -> Bool
checkChar x l 
  | x `elem` l = True
  | otherwise = False

checkStartOfWord :: String -> [String] -> [Bool]
checkStartOfWord x l = map (isPrefixOf x) l

-- addChar
