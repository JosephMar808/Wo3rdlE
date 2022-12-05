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
correct :: String -> String -> Integer
correct x y = error "not done yet"

wrongP :: String -> String -> Integer
wrongP x y = error "not done yet"

wrong :: String -> String -> Integer
wrong x y = error "not done yet"

isString :: String -> Maybe a
isString x = error "not done yet"

howClose :: String -> String -> Either String [Integer]
howClose x y = case isString x of 
               Nothing -> Left "Please enter strings:"
               Just b -> Right [correct x y : wrongP x y : wrong x y]

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
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord of
                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Left e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn e
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord of
                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Left e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn e
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord of
                                                                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Left e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn e
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord of
                                                                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses. if you would like to play again, pick your difficulty!" >> run  
    ["medium"] -> do
       superWord <- openFile "medium.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 7 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord of
                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Left e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn e
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord of
                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Left e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn e
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord of
                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Left e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn e
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord of
                                                                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Left e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn e
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord of
                                                                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses. if you would like to play again, pick your difficulty!" >> run                                                                                                                      
    ["hard"] -> do
       superWord <- openFile "hard.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 9 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord of
                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Left e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn e
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord of
                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Left e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn e
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord of
                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Left e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn e
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord of
                                                                                             Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Left e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn e
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord of
                                                                                                                     Right t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses. if you would like to play again, pick your difficulty!" >> run
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
