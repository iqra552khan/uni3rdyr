-- was given a piece of code by gpt with a bunch of 
-- undefined and i had to replace the undefined with 
-- haskell code

studentName :: String
studentName = "Iqra"

marks :: [Int]
marks = [68, 75, 81, 59, 72]

totalMarks :: Int
totalMarks = sum marks

numberOfMarks :: Int
numberOfMarks = length marks

highestMark :: Int
highestMark = maximum marks

lowestMark :: Int
lowestMark = minimum marks

firstMark :: Int
firstMark = head marks

lastMark :: Int
lastMark = last marks

passedFirstExam :: Bool
passedFirstExam =
    if marks !! 0 > 40
        then True
        else False

resultMessage :: String
resultMessage =
    if passedFirstExam == True
        then studentName ++ " passed the first exam"
        else studentName ++ " failed the first exam"