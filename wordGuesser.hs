import System.IO
import Data.Char
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
correct :: String -> String -> [String]
correct [] [] = []
correct [] (y:ys) = error "please type the amount of words required"
correct (x:xs) [] = error "please type the amount of words required"
correct (x:xs) (y:ys) = if x == y
                          then [x] : correct xs ys
                          else correct xs ys 

--Works but not for all cases
-- input: swete 
-- Secret: sweet
-- My Output:       [["s","w","e"],["t"],[]]
-- intended output: [["s","w","e"],["t","e"],[]]
wrongP :: String -> String -> Int -> [String]
wrongP [] (y:ys) _ = []
wrongP (x:xs) (y:ys) z = if isCharEq x (y:ys) z == False
                         then case isLetterPresant (x:xs) (y:ys) of
                                   True -> [x] : wrongP xs (y:ys) (z+1)
                                   False -> wrongP xs (y:ys) (z+1)
                         else wrongP xs (y:ys) (z+1)

--Helper for wrongP
isCharEq :: Char -> String -> Int -> Bool
isCharEq x y z = if [x] == take 1 (drop z y)
                      then True
                      else False

wrong :: String -> String -> [String]
wrong [] (y:ys) = []
wrong (x:xs) (y:ys) = case isLetterPresant (x:xs) (y:ys) of 
                           False -> [x] : wrong xs (y:ys)
                           True -> wrong xs (y:ys)

--Helper for wrong/wrongP
isLetterPresant :: String -> String -> Bool
isLetterPresant (x:xs) [] = False
isLetterPresant (x:xs) (y:ys) = case x == y of
                            True -> True
                            False -> isLetterPresant (x:xs) ys


{-
-- not being used but needs to be fixed and used in the main maybe?
isString :: String -> Int -> Maybe [Char]
isString x z = let (y,ys) = span isAlpha x
               in if length y == z 
                  then Just y
                  else Nothing
-}
-- Helper for howClose
bothEq :: String -> String -> Bool
bothEq [] [] = True
bothEq (x:xs) (y:ys) = x == y && bothEq xs ys
bothEq _ _ = False

howClose :: String -> String -> Int -> Either String [[String]]
howClose x y z = case bothEq x y of 
               True -> Left "yay"
               False -> Right (correct x y : wrongP x y 0 : [wrong x y])

run :: IO ()
run = do
  putStrLn "Please type what difficulty you want!"
  putStrLn "easy, medium, hard"
  cmd <- getLine 
  case words cmd of 
    ["easy"] -> do
       superWord <- openFile "easy.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 5 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord 5 of
                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Right e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn (show e)
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord 5 of
                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Right e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn (show e)
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord 5 of
                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Right e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn (show e)
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord 5 of
                                                                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Right e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn (show e)
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord 5 of
                                                                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses. if you would like to play again, pick your difficulty!" >> run  
    ["medium"] -> do
       superWord <- openFile "medium.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 7 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord 7 of
                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Right e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn (show e)
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord 7 of
                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Right e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn (show e)
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord 7 of
                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Right e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn (show e)
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord 7 of
                                                                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Right e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn (show e)
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord 7 of
                                                                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                                                     _ -> putStrLn "Sorry your out of guesses. if you would like to play again, pick your difficulty!" >> run                                                                                                                      
    ["hard"] -> do
       superWord <- openFile "hard.txt" ReadMode
       secertWord <- hGetLine superWord
       putStrLn "The word is 9 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       case howClose userGuess secertWord 9 of
                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                     Right e -> do 
                               putStrLn "[Correct, Placement, Wrong]"
                               putStrLn (show e)
                               putStrLn "You have 4 more guesses! Please try again:"
                               userGuess <- getLine
                               case howClose userGuess secertWord 9 of
                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                             Right e -> do 
                                                       putStrLn "[Correct, Placement, Wrong]"
                                                       putStrLn (show e)
                                                       putStrLn "You have 3 more guesses! Please try again:"
                                                       userGuess <- getLine
                                                       case howClose userGuess secertWord 9 of
                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                     Right e -> do 
                                                                               putStrLn "[Correct, Placement, Wrong]"
                                                                               putStrLn (show e)
                                                                               putStrLn "You have 2 more guesses! Please try again:"
                                                                               userGuess <- getLine
                                                                               case howClose userGuess secertWord 9 of
                                                                                             Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
                                                                                             Right e -> do 
                                                                                                       putStrLn "[Correct, Placement, Wrong]"
                                                                                                       putStrLn (show e)
                                                                                                       putStrLn "You have 1 more guess! Please try again:"
                                                                                                       userGuess <- getLine
                                                                                                       case howClose userGuess secertWord 9 of
                                                                                                                     Left t -> putStrLn "Congrats! you guessed the word!, if you would like to play again pick your difficulty!" >> run
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
