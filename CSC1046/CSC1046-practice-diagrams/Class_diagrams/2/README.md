classDiagram
direction LR
class Game {
+startGame()
+addPlayer(p: Player)
}
class Player {
+name: String
+solveCase(c: Case) Boolean
}
class Case {
+caseId: String
+isSolved: Boolean
}
Game "1" --> "*" Player
Game *-- "*" Case
Player ..> Case : solves

%% members use a colon : 