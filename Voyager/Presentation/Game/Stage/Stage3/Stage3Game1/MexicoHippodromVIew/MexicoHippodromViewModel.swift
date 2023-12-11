//MARK: - UPD
import Combine

final class MexicoHippodromViewModel: ObservableObject {
    
    @Published private(set) var _gameStatus: GameStatus = .chooseHorse
    
    @Published var selectedRate = 0.0
    
    @Published var selectedBetSize = 0
    
    var  horsesNames = ["черныш", "снежок", "идущий к реке", "ракета", "молния", "ляля", "панда"].shuffled()
    
    var horsesRate = [1.1,  1.5, 1.66, 1.75, 2.6, 3.2, 2.53].shuffled()
    
    var sizeOfBet = [100, 300, 500, 1000]
    
    func setChooseHorse() {
        _gameStatus = .chooseHorse
    }
    
    func setChooseSizeOfBet() {
        _gameStatus = .chooseSizeOfBet
    }
    
    func setAnimation() {
        _gameStatus = .animation
    }
    
    func setResult() {
        _gameStatus = .result
    }
    
    func determineWine() -> Bool {
        let winChance: Double
        
        switch selectedRate {
        case 1.1:
            winChance = 0.8
        case 1.5:
            winChance = 0.7
        case 1.66:
            winChance = 0.65
        case 1.75:
            winChance = 0.6
        case 2.53:
            winChance = 0.45
        case 2.6:
            winChance = 0.4
        default:
            winChance = 0.25
        }
        
        let random = Double.random(in: 0..<1)
        return random <= winChance
    }
    
    enum GameStatus {
        case chooseHorse, chooseSizeOfBet, animation, result
    }
    
}
