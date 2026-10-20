{-
    if condition
        then restultWhenTrue
        else resultWhenFalse
-}

-- example in a funciton
gradeResult :: Int -> String
gradeResult x =
            if x >= 40
                then "You passed !"
                else "You failed !"