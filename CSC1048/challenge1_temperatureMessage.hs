-- tempMessage :: Float -> String
-- anything greater than 20 is hot

tempMessage :: Float -> String
tempMessage x = 
    if x >= 20
        then "Hot"
    else "not hot"