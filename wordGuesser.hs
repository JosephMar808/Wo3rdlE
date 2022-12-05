import System.IO

{-
data Guesses = Ans String 
functions we need:
* bind
* unit
* functor
* applactive
* monad
* equal (used to recursivly check if the letters are right or wrong) 
-}


run :: IO ()
run = do
  cmd <- getLine 
  case words cmd of 
    ["easy"] -> do
       superWord <- openFile "easy.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "Enter a guess between 1 and 10: "
       userGuess <- getLine 
       if userGuess == secertWord
                     then putStrLn "You win"
                     else run 
    ["medium"] -> do
       superWord <- openFile "medium.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "Enter a guess between 1 and 10: "
       userGuess <- getLine
       if userGuess == secertWord
                     then putStrLn "You win"
                     else run

    ["hard"] -> do
       superWord <- openFile "hard.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "Enter a guess between 1 and 10: "
       userGuess <- getLine
       if userGuess == secertWord
                     then putStrLn "You win"
                     else run
    ["quit"] -> putStrLn "See ya later"

main :: IO ()
main = do 
   run 


{-
Output:
hello
hlkeo
Correct: h,o  
Wrong place: l,e
Wrong: k
-}
