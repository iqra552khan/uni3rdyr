-- 1. area of triangle function 

triangleArea ::  Float -> Float -> Float -> Float
triangleArea a b c = 
    if a+b > c || a+c > b || b+c > a 
        then
        let s = (a+b+c)/2
        in sqrt ((s*(s-a)*(s-b)*(s-c)))
    else error "\nnot a triangle\n"


-- Design a Haskell function isSum that takes three integer 
-- arguments and tests whether one of them is the sum of 
-- the other two. 

isSum :: Int -> Int -> Int -> Bool
isSum x y z =
    if x + y == z || x + z == y || y + z == x
        then True
    else False