studentName :: String
studentName = "Iqra"

marks :: [Int]
marks = [48, 72, 65, 81, 54]

-- Return the student's full name
greeting :: String -> String
greeting name = "Hello," ++studentName

-- Add five marks to a score
addBonus :: Int -> Int
addBonus mark = mark + 5

-- Return the highest mark
highestMark :: [Int] -> Int
highestMark marks = maximum marks

-- Return the first three marks
firstThreeMarks :: [Int] -> [Int]
firstThreeMarks scores = take 3 scores

-- Check whether 100 appears in the list
containsPerfectScore :: [Int] -> Bool
containsPerfectScore scores = elem 100 scores

-- Return "Pass" for 50 or more; otherwise return "Fail"
gradeResult :: Int -> String
gradeResult mark =
    if mark >= 50
        then "Pass"
        else "Fail"

-- Create the first five multiples of 10:
-- [10,20,30,40,50]
multiplesOfTen :: [Int]
multiplesOfTen = take 5[10,20..]