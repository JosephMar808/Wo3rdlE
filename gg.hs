import System.Random
import System.IO

main = do
    file_handle <- openFile "easy.txt" ReadMode
    contents <- hGetContents file_handle
    let words_list = lines contents
    random_index <- randomRIO (0, length words_list - 1)
    let random_word = words_list !! random_index
    putStrLn random_word
    hClose file_handle
