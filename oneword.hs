import System.IO

main :: IO ()
main = do
   helloFile <- openFile "easy.txt" ReadMode
   firstLine <- hGetLine helloFile
   putStrLn firstLine
   secondLine <- hGetLine helloFile
   goodbyeFile <- openFile "medium.txt" WriteMode
   hPutStrLn goodbyeFile secondLine
   hClose helloFile
   hClose goodbyeFile
   putStrLn "done!"


