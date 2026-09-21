# Haskell Lesson 1 Cheat Sheet

This guide covers the first Haskell topics: using Haskell through WSL and VS Code, GHCi, expressions, types, basic functions, conditionals, lists, list functions, ranges, and common errors.

## Colour key

| Marker | Category |
|---|---|
| 🔵 | Core ideas and setup |
| 🟢 | Syntax and runnable code |
| 🟣 | Lists, strings, and ranges |
| 🟠 | Important rules and cautions |
| 🔴 | Errors and debugging |

> [!TIP]
> When revising quickly, read the coloured headings, tables, and examples first. The paragraphs underneath explain *why* the code works.

---

## 🔵 1. The basic idea of Haskell

Haskell is a **functional programming language**. Instead of writing a sequence of commands that repeatedly change variables, you mainly define functions that turn inputs into outputs.

```haskell
double x = x * 2
```

Evaluating `double 5` can be understood as substitution:

```text
double 5
= 5 * 2
= 10
```

Key ideas:

- Everything in Haskell is an **expression** that evaluates to a value.
- Every value has a **type**.
- Values do not normally change after being defined.
- Haskell can often infer types automatically.
- Haskell is **lazy**: it evaluates a value only when that value is needed.

---

## 🔵 2. Working with Haskell in WSL and VS Code

### Check whether Haskell is installed

Open your WSL terminal and run:

```bash
ghci
```

If GHCi starts, Haskell is installed. Leave it with:

```haskell
:quit
```

or:

```haskell
:q
```

If `ghci` is not found on Ubuntu WSL, install GHC:

```bash
sudo apt update
sudo apt install ghc
```

### Create a working folder and Haskell file

In WSL:

```bash
mkdir haskell-practice
cd haskell-practice
code .
```

In VS Code, create a file named:

```text
Lesson1.hs
```

You can also create and open it directly from WSL:

```bash
code Lesson1.hs
```

Install the **Haskell** VS Code extension if you have not already done so.

### Load and run the file

Save the file in VS Code, then run this from the same directory in WSL:

```bash
ghci Lesson1.hs
```

If it loads successfully, the prompt will normally change from `ghci>` to something such as:

```text
*Main>
```

You can now test functions from the file:

```haskell
double 6
```

### Normal edit-and-test routine

1. Edit the `.hs` file in VS Code.
2. Save it with `Ctrl+S`.
3. Return to GHCi.
4. Reload the saved file with `:r`.
5. Test the function.

Useful GHCi commands:

| Command | Meaning |
|---|---|
| `:load Lesson1.hs` or `:l Lesson1.hs` | Load a file |
| `:reload` or `:r` | Reload the current file after saving changes |
| `:type item` or `:t item` | Show the type of a value or function |
| `:quit` or `:q` | Exit GHCi |

If you start GHCi before loading a file, load it with:

```haskell
:load Lesson1.hs
```

Important: ordinary Haskell definitions belong in the `.hs` file. GHCi is mainly for loading the file and testing expressions.

> [!IMPORTANT]
> Your normal routine is: **edit in VS Code → save with `Ctrl+S` → enter `:r` in GHCi → test the function**.

---

## 🟢 3. Expressions and operators

### Arithmetic

```haskell
2 + 3       -- 5
10 - 4      -- 6
6 * 7       -- 42
20 / 4      -- 5.0
2 ^ 5       -- 32
17 `div` 5  -- 3: whole-number division
17 `mod` 5  -- 2: remainder
```

The backticks allow a normal two-argument function to be written between its arguments:

```haskell
div 17 5
17 `div` 5
```

These two expressions mean the same thing.

### Comparisons and Boolean logic

| Haskell | Meaning |
|---|---|
| `x == y` | x equals y |
| `x /= y` | x does not equal y |
| `x < y` | x is less than y |
| `x <= y` | x is less than or equal to y |
| `x > y` | x is greater than y |
| `x >= y` | x is greater than or equal to y |
| `a && b` | a AND b |
| `a \|\| b` | a OR b |
| `not a` | reverse a Boolean value |

Examples:

```haskell
7 == 7                 -- True
7 /= 4                 -- True
10 > 20                -- False
5 > 2 && 10 < 20       -- True
5 == 4 || 6 == 6       -- True
not False              -- True
```

Haskell Boolean values start with capital letters:

```haskell
True
False
```

---

## 🟢 4. Comments

A single-line comment begins with `--`:

```haskell
-- This is a comment.
double x = x * 2  -- This can also follow code.
```

A multiline comment is placed between `{-` and `-}`:

```haskell
{-
This is a
multiline comment.
-}
```

---

## 🔵 5. Basic types

Everything in Haskell has a type.

| Type | Meaning | Example |
|---|---|---|
| `Int` | Fixed-range whole number | `42` |
| `Integer` | Whole number without a small fixed limit | `999999999999` |
| `Float` | Decimal number | `4.5` |
| `Double` | More precise decimal number | `4.5` |
| `Char` | One character | `'A'` |
| `String` | Text; a list of characters | `"Hello"` |
| `Bool` | True or false | `True` |
| `[Int]` | List of integers | `[1,2,3]` |

Important distinction:

```haskell
'A'       -- Char: single quotes and exactly one character
"Apple"   -- String: double quotes
```

> [!IMPORTANT]
> Single quotes create one `Char`, such as `'A'`. Double quotes create a `String`, such as `"Apple"`.

Use `:t` in GHCi to inspect types:

```haskell
:t True
:t "Hello"
:t [1,2,3]
:t not
```

GHCi may show a general type involving a typeclass:

```haskell
12 :: Num a => a
```

For now, read this roughly as: **12 can be any type that behaves like a number**.

---

## 🟢 6. Values and functions

### Defining a value

```haskell
age :: Int
age = 20

studentName :: String
studentName = "Iqra"

isStudent :: Bool
isStudent = True
```

The line containing `::` is the **type signature**. The next line defines the value.

### Defining a one-parameter function

```haskell
double :: Int -> Int
double x = x * 2
```

Read the signature as:

```text
double receives an Int and returns an Int.
```

### Defining a two-parameter function

```haskell
rectangleArea :: Float -> Float -> Float
rectangleArea width height = width * height
```

The final type is the return type:

```text
rectangleArea :: Float -> Float -> Float
                 input    input    output
```

Call functions by separating the name and arguments with spaces:

```haskell
rectangleArea 4.0 5.0
```

Do not use the usual brackets-and-commas style from many other languages:

```haskell
-- Not normal Haskell function-call syntax:
-- rectangleArea(4.0, 5.0)
```

More examples:

```haskell
square :: Int -> Int
square x = x * x

averageOfTwo :: Float -> Float -> Float
averageOfTwo x y = (x + y) / 2

greet :: String -> String
greet name = "Hello, " ++ name
```

---

## 🟢 7. `if`, `then`, `else`

General form:

```haskell
if condition
    then resultWhenTrue
    else resultWhenFalse
```

Example:

```haskell
numberSize :: Int -> String
numberSize x =
    if x > 100
        then "Large"
        else "Small"
```

Unlike in many imperative languages, Haskell's `if` is an expression that must produce a result. Therefore:

- `else` is required.
- The `then` and `else` results must have compatible types.

> [!WARNING]
> You cannot omit `else`, and you cannot return a number from one branch and a string from the other.

Valid:

```haskell
if x > 100 then "Large" else "Small"
```

Invalid because the branches return different types:

```haskell
-- if x > 100 then "Large" else 0
```

A condition already evaluates to a `Bool`, so this:

```haskell
isAdult :: Int -> Bool
isAdult age =
    if age >= 18
        then True
        else False
```

can be shortened to:

```haskell
isAdult :: Int -> Bool
isAdult age = age >= 18
```

---

## 🟣 8. Lists

A list is an ordered collection whose elements all have the **same type**.

> [!IMPORTANT]
> A list may contain many values, but every value in that list must have the same type.

```haskell
numbers :: [Int]
numbers = [1,3,5,7]

colours :: [String]
colours = ["red", "green", "blue"]
```

Valid:

```haskell
[1,2,3]
[True,False,True]
["red","blue"]
```

Invalid because the elements have different types:

```haskell
-- [1,"hello",True]
```

The empty list is:

```haskell
[]
```

### Joining two lists with `++`

```haskell
[1,2] ++ [3,4]       -- [1,2,3,4]
"Hello " ++ "World"  -- "Hello World"
```

Both operands of `++` must be lists.

```haskell
-- Invalid: 0 is an Int, not a list.
-- 0 ++ [5,10,15]

-- Valid:
[0] ++ [5,10,15]
```

### Adding one item to the front with `:`

The `:` operator is called **cons**.

```haskell
0 : [5,10,15]  -- [0,5,10,15]
'H' : "ello"   -- "Hello"
```

Its pattern is:

```text
one element : list of that element type
```

Lists are constructed from `:` and the empty list:

```haskell
[1,2,3]
```

is shorthand for:

```haskell
1 : 2 : 3 : []
```

### `:` compared with `++`

| Operator | Left side | Right side | Example |
|---|---|---|---|
| `:` | One element | A list | `1 : [2,3]` |
| `++` | A list | A list | `[1] ++ [2,3]` |

> [!TIP]
> Remember it as **one item `:` list**, but **list `++` list**.

Both examples produce `[1,2,3]`, but `:` is the direct way to add one item to the front.

### Accessing an element with `!!`

List indexes begin at `0`:

```haskell
[10,20,30,40] !! 0  -- 10
[10,20,30,40] !! 2  -- 30
```

For a nested list:

```haskell
scores = [[50,60,70], [80,90,100], [45,55,65]]
```

Get the second list:

```haskell
scores !! 1  -- [80,90,100]
```

Get `90`:

```haskell
(scores !! 1) !! 1  -- 90
```

Warning: asking for an index that does not exist causes a runtime error.

> [!CAUTION]
> Indexes begin at `0`. Using `!!` with an index outside the list causes a runtime error.

---

## 🟣 9. Common list functions

Given:

```haskell
numbers = [2,4,6,8]
```

| Expression | Result | Meaning |
|---|---:|---|
| `head numbers` | `2` | First element |
| `tail numbers` | `[4,6,8]` | Everything except the first element |
| `last numbers` | `8` | Final element |
| `init numbers` | `[2,4,6]` | Everything except the final element |
| `length numbers` | `4` | Number of elements |
| `null numbers` | `False` | Tests whether the list is empty |
| `reverse numbers` | `[8,6,4,2]` | Reverses the list |
| `take 2 numbers` | `[2,4]` | Takes the first two elements |
| `drop 2 numbers` | `[6,8]` | Removes the first two elements |
| `maximum numbers` | `8` | Largest element |
| `minimum numbers` | `2` | Smallest element |
| `sum numbers` | `20` | Adds all elements |
| `product numbers` | `384` | Multiplies all elements |
| `elem 4 numbers` | `True` | Tests whether `4` occurs in the list |

`elem` can also be written between its arguments:

```haskell
4 `elem` numbers
```

Be careful with partial functions:

```haskell
head []  -- runtime error
last []  -- runtime error
```

> [!CAUTION]
> `head`, `tail`, `last`, and `init` can fail on an empty list. We will later use pattern matching to handle empty lists safely.

---

## 🟣 10. Strings are lists of characters

In Haskell:

```haskell
type String = [Char]
```

Therefore, ordinary list operations work on strings:

```haskell
head "Haskell"       -- 'H'
tail "Haskell"       -- "askell"
length "Haskell"     -- 7
reverse "Haskell"    -- "lleksaH"
take 3 "Haskell"     -- "Has"
'H' : "ello"         -- "Hello"
"Hello" ++ "!"       -- "Hello!"
elem 'k' "Haskell"   -- True
```

---

## 🟣 11. Ranges

Use range syntax for regularly spaced values:

```haskell
[1..5]       -- [1,2,3,4,5]
[2,4..10]    -- [2,4,6,8,10]
[10,9..5]    -- [10,9,8,7,6,5]
['a'..'e']   -- "abcde"
```

In `[2,4..10]`, the first two values establish a step of `2`.

### Infinite ranges and laziness

This represents an infinite list:

```haskell
[1..]
```

Do not try to display the entire list. Ask only for a finite part:

```haskell
take 5 [1..]       -- [1,2,3,4,5]
take 4 [10,20..]   -- [10,20,30,40]
```

> [!WARNING]
> Never ask GHCi to display an entire infinite list such as `[1..]`. Use `take` to request a finite part.

This works because Haskell generates only the values that `take` needs.

Functions can be combined:

```haskell
take 3 (drop 5 [5,10..])  -- [30,35,40]
```

Read from the innermost brackets outward:

1. `[5,10..]` creates the multiples of five.
2. `drop 5` removes `5,10,15,20,25`.
3. `take 3` takes `30,35,40`.

---

## 🟠 12. Negative arguments and brackets

When passing a negative number to a function, put it in parentheses:

```haskell
absoluteValue (-7)
```

Without parentheses, the minus sign can be interpreted as subtraction.

Parentheses are also useful for controlling evaluation:

```haskell
square (2 + 3)      -- square 5, producing 25
(scores !! 1) !! 1 -- select an inner list, then an element
```

Function application has high precedence. For example:

```haskell
double 3 + 1
```

means:

```haskell
(double 3) + 1
```

---

## 🟠 13. Layout and naming rules

- Haskell is case-sensitive: `True` and `true` are different.
- Variable and function names normally begin with a lowercase letter.
- Type names begin with an uppercase letter, such as `Int`, `String`, and `Bool`.
- Indentation matters, so align related lines consistently.
- Use descriptive camelCase names such as `rectangleArea` and `studentName`.

Example:

```haskell
temperatureMessage :: Float -> String
temperatureMessage temperature =
    if temperature > 20
        then "Hot"
        else "Not hot"
```

---

## 🔴 14. Reading common error messages

Haskell error messages are detailed, but the underlying problem is often a type mismatch.

> [!TIP]
> When an error looks overwhelming, first check: **Did I mix types? Did I forget `else`? Did I use `:` and `++` correctly? Did I save and reload the file?**

### Mixing incompatible types

```haskell
-- Invalid: a number cannot be added to a string.
-- 1 + "2"
```

### Mixing element types in a list

```haskell
-- Invalid: Int and String values are mixed.
-- [1,2,"3"]
```

### Returning different types from `if`

```haskell
-- Invalid: one branch returns an Int and the other a String.
-- if True then 10 else "ten"
```

### Confusing `:` with `++`

```haskell
0 : [5,10,15]       -- valid: element : list
[0] ++ [5,10,15]    -- valid: list ++ list
-- 0 ++ [5,10,15]   -- invalid: 0 is not a list
```

### Calling a list function on a non-list

```haskell
-- Invalid: head expects a list.
-- head 12
```

### File changes not appearing in GHCi

After editing:

1. Save the file in VS Code.
2. Enter `:r` in GHCi.
3. Read any compilation error before testing the function.

---

## 🟢 15. Complete example file

The following can be copied into `Lesson1.hs`:

```haskell
-- Lesson 1 examples

studentName :: String
studentName = "Iqra"

marks :: [Int]
marks = [68,75,81,59,72]

double :: Int -> Int
double x = x * 2

square :: Int -> Int
square x = x * x

rectangleArea :: Float -> Float -> Float
rectangleArea width height = width * height

averageOfTwo :: Float -> Float -> Float
averageOfTwo x y = (x + y) / 2

greet :: String -> String
greet name = "Hello, " ++ name

isAdult :: Int -> Bool
isAdult age = age >= 18

evenOrOdd :: Int -> String
evenOrOdd x =
    if x `mod` 2 == 0
        then "Even"
        else "Odd"

largerNumber :: Int -> Int -> Int
largerNumber x y =
    if x >= y
        then x
        else y

describeList :: [Int] -> String
describeList numbers =
    if null numbers
        then "The list is empty"
        else "The list is not empty"

firstThree :: [Int] -> [Int]
firstThree numbers = take 3 numbers

containsTen :: [Int] -> Bool
containsTen numbers = elem 10 numbers

resultMessage :: String
resultMessage =
    if head marks >= 50
        then studentName ++ " passed the first exam"
        else studentName ++ " failed the first exam"
```

Load it in WSL:

```bash
ghci Lesson1.hs
```

Then test it in GHCi:

```haskell
double 6
square 5
rectangleArea 4.0 7.0
greet "Iqra"
isAdult 20
evenOrOdd 9
largerNumber 12 8
describeList []
firstThree [1..10]
containsTen [5,10,15]
resultMessage
```

---

## 🟢 16. Quick-reference table

| Goal | Haskell |
|---|---|
| Define a value | `age = 20` |
| Give a value a type | `age :: Int` |
| Define a function | `double x = x * 2` |
| Call a function | `double 5` |
| Inspect a type in GHCi | `:t double` |
| Compare equality | `x == y` |
| Compare inequality | `x /= y` |
| Conditional expression | `if condition then a else b` |
| Empty list | `[]` |
| Add an element to front | `x : xs` |
| Join two lists | `xs ++ ys` |
| Access by index | `xs !! index` |
| Test membership | `elem x xs` or ``x `elem` xs`` |
| List from 1 to 10 | `[1..10]` |
| Even numbers to 10 | `[2,4..10]` |
| First five natural numbers | `take 5 [1..]` |
| Reload the file | `:r` |
| Exit GHCi | `:q` |

---

## 🔵 17. Self-check before Lesson 2

You are ready to continue when you can do these without looking up every step:

- Create a `.hs` file in VS Code from WSL.
- Load it with `ghci FileName.hs`.
- Save changes and reload with `:r`.
- Read a simple type signature such as `Int -> Int -> Int`.
- Define and call a basic function.
- Write an `if/then/else` expression.
- Explain why list elements must share a type.
- Explain the difference between `:` and `++`.
- Use `head`, `tail`, `length`, `take`, `drop`, `sum`, and `elem`.
- Create ordinary and infinite ranges safely.

Next topics: tuples and list comprehensions.
