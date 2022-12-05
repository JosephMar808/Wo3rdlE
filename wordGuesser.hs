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
-- i just want to test something
getWords :: FilePath -> IO [String]
getWords path = do contents <- readFile path
                   return (lines contents)

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


{-
Output:
hello
hlkeo
Correct: h,o  
Wrong place: l,e
Wrong: k
-}
