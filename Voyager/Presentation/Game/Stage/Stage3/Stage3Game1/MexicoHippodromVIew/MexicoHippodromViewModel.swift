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
    
    func resetGame() {
        self.selectedRate = 0.0
        self.selectedBetSize = 0
        self.horsesNames = self.horsesNames.shuffled()
        self.horsesRate = self.horsesRate.shuffled()
        self._gameStatus = .chooseHorse
    }
    
    func determineWine() -> Bool {
        let winChance: Double
        let karmaBonus: Double
        
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
        
        switch StorageManager.shared.gameKarma {
        case 0:
            karmaBonus = -0.20
        case 5:
            karmaBonus = -0.18
        case 10:
            karmaBonus = -0.16
        case 15:
            karmaBonus = -0.14
        case 20:
            karmaBonus = -0.12
        case 25:
            karmaBonus = -0.10
        case 30:
            karmaBonus = -0.08
        case 35:
            karmaBonus = -0.06
        case 40:
            karmaBonus = -0.04
        case 45:
            karmaBonus = -0.02
        case 50:
            karmaBonus = 0
        case 55:
            karmaBonus = 0.02
        case 60:
            karmaBonus = 0.04
        case 65:
            karmaBonus = 0.06
        case 70:
            karmaBonus = 0.08
        case 75:
            karmaBonus = 0.10
        case 80:
            karmaBonus = 0.12
        case 85:
            karmaBonus = 0.14
        case 90:
            karmaBonus = 0.16
        case 95:
            karmaBonus = 0.18
        case 100:
            karmaBonus = 0.20
            
        default:
            karmaBonus = 0
        }
        
        let random = Double.random(in: 0..<1)
        return random <= winChance + karmaBonus
    }
    
    enum GameStatus {
        case chooseHorse, chooseSizeOfBet, animation, result
    }
    
}
