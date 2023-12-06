import Combine

final class LoteryViewModel: ObservableObject {
    
    @Published private(set) var _gameStatus: GameStatus = .game
    
    @Published var numberHidden = true
    
    @Published var firstStep =  true
    @Published var secondStep = false
    @Published var thirdStep = false
    
    func setGame() {
        _gameStatus = .game
    }   
    func setResult() {
        _gameStatus = .result
    }
    
    
    enum GameStatus {
        case game
        case result
    }
}
