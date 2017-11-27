module Main where

main :: IO ()
main = do
  let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  val <- getLine
  if check val letters
    then putStrLn "Valid"
    else putStrLn "Invalid"
  

check :: String -> [String] ->Bool
check x l 
  | x `elem` l = True
  | otherwise = False