
longerList :: [Int] -> [Int] -> [Int]
longerList x y =
    if length x > length y
        then x
    else y