-- Stores values of the SAME TYPE


                            -- SIMPLE LIST OPERATIONS

-- simple list example
ages :: [Int]
ages = [19, 20, 34, 17]

-- add element to start of list
-- element : list
add_element list = 0 : list

-- join lists 
-- List1 ++ List2
join_Lists list1 list2 = list1 ++ list2

-- get element from x postion in list
-- list !! index
find_index list_ index = (list_ !! index)



                        -- NESTED LISTS - list containing other lists

-- accessing the value of a nested list
-- (list !! outerindex) !! innerindex
classScores = [[50, 60, 40],[35, 76, 90],[20, 99, 45]]
nested_index = (classScores !! 1) !! 2



                        -- BASIC LIST FUNCTIONS
myList = ["Apple", "Banana", "Pear", "Fig"]

myHead = head myList -- head, first element
myTail = tail myList -- all except first element
myLast = last myList -- last element
myInit = init myList -- all except last element
myLength = length myList
myNull = null myList -- checks if list is empty, returns bool
myReverse = reverse myList -- reverses list




-- take and drop, taking and removing elements from beginning of list
-- syntax
    -- take/drop amount list
myList3 = [2,3,4,5,6,7,8]
myTake = take 3 myList3
myDrop = drop 2 myList3

--example of drop and take
firstThreeMarks :: [Int] -> [Int]
firstThreeMarks scores = take 3 scores
-- input example : firstThreeMarks [48,72,65,81,54]



                        --CALCULATING WITH LISTS
myMax = maximum myList3
myMin = minimum myList3
mySum = sum myList3  -- adds all elements in list
myProduct = product myList3  -- mulitplies all elements in list


                        

                        -- CHECKING IF AN ELEMENT IS IN A LIST
--syntax 
    -- elem x list
checkElement :: [Int] -> Int -> Bool 
checkElement myList x = elem x myList



                        -- RANGES
-- syntax
    -- [start..end]
    -- [start, next..end]
-- eg [2,4..10] is [2,4,6,8,10]

-- [1..] makes an infinite list

-- combine take and ranges
rangeList = [2,4..30] -- creates a list with 2,4 and continuing in that pattern until 30
multiplesOfTwo ::  Int -> [Int]
multiplesOfTwo x = take x rangeList 



                        -- TO DECLARE TYPE OF THE LIST

listx :: [String]
listx = ["Hello", "my", "name", "is", "iqra"] -- this is of string type

listy :: [[String]]
listy =  [["Apple", "Banana", "Pear", "Fig"], ["orange", "Berry"]] -- this is a nested list, notice how you must declare the type, and all elements must be of the same type
