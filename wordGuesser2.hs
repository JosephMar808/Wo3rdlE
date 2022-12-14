import System.IO
import Data.Char
import System.Random 


correct :: String -> String -> [String]
correct [] [] = []
correct (x:xs) (y:ys) = if x == y
                          then [x] : correct xs ys
                          else correct xs ys 

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

-- Helper for howClose
bothEq :: String -> String -> Bool
bothEq [] [] = True
bothEq (x:xs) (y:ys) = x == y && bothEq xs ys

howClose :: String -> String -> Int -> Either String [[String]]
howClose x y z = case bothEq x y of 
               True -> Left "yay"
               False -> Right (correct x y : wrongP x y 0 : [wrong x y])

guessNum :: String -> String -> Int -> Int -> IO ()
guessNum x y z n = case howClose x y z of 
                Left t -> putStrLn "Congrats! you guessed the word!" >> return ()
                Right e -> do
                        putStrLn "[Correct, Placement, Wrong]"
                        putStrLn (show e)
                        putStr (show (n - 1))
                        putStrLn " more guesses! Please try again:"
                        userGuess <- getLine
                        if n > 2
                        then guessNum userGuess y z (n-1) 
                        else if bothEq userGuess y 
                             then putStrLn "Congrats! you guessed the word!" >> return ()
                             else putStrLn (show y) >> return ()

run :: IO ()
run = do
  putStrLn "Please type what difficulty you want!, or type quit to exit the game"
  putStrLn "easy, medium, hard"
  cmd <- getLine 
  case words cmd of 
    ["easy"] -> do
       superWord <- openFile "easy.txt" ReadMode
       secertWord <- hGetContents superWord
       let w_list = lines secertWord
       random_in <- randomRIO (0, length w_list - 1)
       let numword = w_list !! random_in
       putStrLn "The word is 5 letters long, go ahead and try to guess the word: "
       userGuess <- getLine
       guessNum userGuess numword 5 5
    ["medium"] -> do
       superWord <- openFile "medium.txt" ReadMode
       secertWord <- hGetContents superWord
       let w_list = lines secertWord
       random_in <- randomRIO (0, length w_list - 1)
       let numword = w_list !! random_in
       putStrLn "The word is 7 letters long, go ahead and try to guess the word: "
       userGuess <- getLine 
       guessNum userGuess numword 7 7 
    ["hard"] -> do
       superWord <- openFile "hard.txt" ReadMode
       secertWord <- hGetContents superWord
       let w_list = lines secertWord
       random_in <- randomRIO (0, length w_list - 1)
       let numword = w_list !! random_in
       putStrLn "The word is 9 letters long, go ahead and try to guess the word: "
       userGuess <- getLine
       guessNum userGuess numword 9 9
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
