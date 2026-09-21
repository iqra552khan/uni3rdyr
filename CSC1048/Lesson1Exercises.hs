double :: Int -> Int
double x = x*2

triple :: Int -> Int
triple x = x*3

square :: Int -> Int
square x = x^2

addTen :: Int -> Int
addTen x = x+10

rectangleArea :: Float -> Float -> Float
rectangleArea width height = width*height

rectanglePerimeter :: Float -> Float -> Float
rectanglePerimeter width height = (width*2) + (height*2)

averageOfTwo :: Float -> Float -> Float
averageOfTwo x y = (x+y)/2

--------------------------

greet :: String -> String
greet name = "Hello, "++name

fullName :: String -> String -> String
fullName firstName lastName = firstName ++ " " ++ lastName

surround :: String -> String
surround word = "[" ++ word ++ "]"

---------------------------

isAdult :: Int -> Bool
isAdult age =
    if age >= 18
        then True
        else False

largerNumber :: Int -> Int -> Int
largerNumber x y =
    if x > y
        then x
        else y

absoluteValue :: Int -> Int
absoluteValue x =
    if x < 0
        then x * (-1)
        else x

evenOrOdd :: Int -> String
evenOrOdd x =
    if x `mod` 2 == 0
        then "Even"
        else "Odd"


------------------------------------
-- Exercise 2

1 : [2,3,4,5]