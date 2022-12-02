import Data.Char
import Data.List

--lexer
--parser

run :: IO()
run = do 
   let secertWord = "5"
   putStrLn "Enter a guess between 1 and 10: "
   userGuess <- getLine 

   if userGuess == secertWord
   then putStrLn "You win"
   else run 

main :: IO ()
main = do 
   run 
