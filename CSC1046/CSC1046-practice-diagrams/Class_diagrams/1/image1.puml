@startuml
class Game {
    '+ means public method
+startGame()   
+endGame()
+addPlayer(player: Player)
}
class Player {
+name: String
+solveCase(c: Case): Boolean
}
class Case {
+caseId: String
+isSolved: Boolean
+addClue(clue: Clue)
}
class Clue {
+clueId: String
+description: String
}

' A Game is composed of many Cases
Game *-- "*" Case

' 1 Game has many players
Game "1" -- "*" Player

' 1 Case has (is associated with) many Clues
Case "1" -- "*" Clue

' --> means direct association,Player has a directed association to exactly one Case, labelled "solves" 
Player --> "1" Case : solves

' -- is a link

@enduml