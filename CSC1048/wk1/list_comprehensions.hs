

-- LIST COMPREHENSION 

-- List comprehendsions : creating a new list from an existing list

-- syntax :
    -- [output | variable <- list, condition1, condition2, ...]




-- take a list and create a new one with the square value of each item 

squareAll :: [Int] -> [Int]
squareAll numbers = [x * x | x <- numbers]


-- Filtering lists using comprehendsions, return values over 50

passingMarks :: [Int] -> [Int]
passingMarks scores = [x | x <- scores, x >= 50]


-- changing items in list AND filtering them

bonusForPassing :: [Int] -> [Int]
bonusForPassing scores = [x +5 | x <- scores, x >= 50]






-- multiple generators : taking values from multiple lists in list comprehendsions
--  CAN create tuple pairs if u want it to
-- synax:
    -- [output | firstVar <- firstList, secondVar <- secondList]



--without tuples

allProducts :: [Int] -> [Int] -> [Int]
allProducts firstList secondList = [x * y | x <- firstList, y <- secondList]

-- example query : allProducts [1,2,3] [10,20] -> [10,20,20,40,30,60]


--with tuples

makePairs :: [Int] -> [Char] -> [(Int, Char)]
makePairs letters numbers = [(x,y) | x <- letters, y <- numbers]

-- example query : makePairs [1,2] ['a','b'] -> [(1,'a'),(1,'b'),(2,'a'),(2,'b')]




-- TUPLES AND TRIPLES