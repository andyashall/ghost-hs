module Main where

-- What should be passed to game? new char to be added 
type Game = (String, [String])

-- Need to import a list of words 

main :: IO ()
main = do
  let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  char <- getLine
  if checkChar char letters
    then putStrLn "Valid"
    else putStrLn "Invalid"

game :: IO ()
game = do

-- Could be used to also check if a word is in a list
checkChar :: String -> [String] -> Bool
checkChar x l 
  | x `elem` l = True
  | otherwise = False

-- addChar

-- checkWord

-- checkStartOfWord - need to check if current string is a valid start to a word