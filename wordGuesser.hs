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
howClose :: String -> String -> Either String [Integer]
howClose x y = error "not ready yet"

run :: IO ()
run = do
  cmd <- getLine 
  case words cmd of 
    ["easy"] -> do
       superWord <- openFile "easy.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 5 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord of
                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Left e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn e
                               putStrLn "Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord of
                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Left e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn e
                                                       putStrLn "Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord of
                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Left e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn e
                                                                               putStrLn "Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord of
                                                                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Left e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn e
                                                                                                       putStrLn "Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord of
                                                                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses."
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
    ["quit"] -> return ()

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
