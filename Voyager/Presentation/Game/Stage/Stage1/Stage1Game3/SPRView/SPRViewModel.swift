import Combine

final class SPRViewModel: ObservableObject {
    
    @Published private(set) var _gameStatus: GameStatus = .initial
    
    
//    @Published var computerChoice = Choices.allCases.first!
    @Published var gameOutcome = ""
    @Published var wins = 0
    @Published var loses = 0
    @Published var round = 0
    @Published var showAlert = false
    @Published var showComputerChoice = false
//    @Published var computerChoice = Choices.allCases.first!
//    @Published var playerChoice: Choices?
    @Published var computerChoice = EnemyChoices.allCases.first!
    @Published var playerChoice: MyChoices?
    
    func setInitial() {
        _gameStatus = .initial
    }   
    func setAnimating() {
        _gameStatus = .animating
    }
    func setResult() {
        _gameStatus = .result
    }
    func setEndGame() {
        _gameStatus = .endGame
    }
    
    func resetGame() {
        _gameStatus = .initial
        gameOutcome = ""
        wins = 0
        loses = 0
        round = 0
        showAlert = false
        showComputerChoice = false
    }
    
    
    

    
    func checkWin(playerChoice: MyChoices) {
        switch playerChoice {
        case .scissors:
            if computerChoice == .scissors {
                gameOutcome = "Ничья"
            } else if computerChoice == .paper {
                gameOutcome = "Победил!"
                wins += 1
            } else {
                gameOutcome = "Проиграл.."
                loses += 1
            }
        case .paper:
            if computerChoice == .scissors {
                gameOutcome = "Не повезло..."
                loses += 1
            } else if computerChoice == .paper {
                gameOutcome = "Ничья"
            } else {
                gameOutcome = "ПО-БЕ-ДА!"
                wins += 1
            }
        case .rock:
            if computerChoice == .scissors {
                gameOutcome = "Выиграл"
                wins += 1
            } else if computerChoice == .paper {
                gameOutcome = "Эх..."
                loses += 1
            } else {
                gameOutcome = "Ничья"
            }
        }
    }
    
    enum GameStatus {
        case initial
        case animating
        case result
        case endGame
    }
    
//    enum Choices: String, CaseIterable {
//        case scissors = "Scissor"
//        case paper = "Paper"
//        case rock  = "Rock"
//    }
    
    enum MyChoices: String, CaseIterable {
        case scissors = "myS"
        case paper = "myP"
        case rock  = "myR"
    }
    
    enum EnemyChoices: String, CaseIterable {
        case scissors = "enS"
        case paper = "enP"
        case rock  = "enR"
    }
    
    func playGame(with choice: SPRViewModel.MyChoices) {
        playerChoice = choice
        computerChoice = SPRViewModel.EnemyChoices.allCases.randomElement() ?? .scissors
        checkWin(playerChoice: choice)
        setAnimating()
    }
    
    
}
