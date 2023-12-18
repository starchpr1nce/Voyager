//MARK: - UPD
import Combine

final class UpdetedSportBettingViewModel: ObservableObject {
    
    @Published private(set) var _gameStatus: GameStatus = .firstQ
    
    @Published var playerRate = 0.0
    
    @Published var playerBetSize = 0
    
    var sizeBet = [100, 200, 300]
    
    var rate = [1.8, 1.9, 2.0, 2.1, 2.2].shuffled()
    
    func setChooseFirstQ() {
        _gameStatus = .firstQ
    }
    
    func setChooseSecondQ() {
        _gameStatus = .secondQ
    }
    
    func setChooseBet() {
        _gameStatus = .chooseBet
    }
    func setAnimation() {
        _gameStatus = .animation
    }
    func setResult() {
        _gameStatus = .result
    }
    
    func determineWin() -> Bool {
       let winChance: Double
        let karmaBonus: Double
       
       switch playerRate {
       case 3.6:
           winChance = 0.66
       case 3.7:
           winChance = 0.64
       case 3.8:
           winChance = 0.62
       case 3.9:
           winChance = 0.60
       case 4.0:
           winChance = 0.58
       case 4.1:
           winChance = 0.56
       case 4.2:
           winChance = 0.54
       case 4.3:
           winChance = 0.52
           
       default:
           winChance = 0.50
       
       }
        
        switch StorageManager.shared.gameKarma {
        case 0:
            karmaBonus = -0.33
        case 5:
            karmaBonus = -0.30
        case 10:
            karmaBonus = -0.27
        case 15:
            karmaBonus = -0.24
        case 20:
            karmaBonus = -0.21
        case 25:
            karmaBonus = -0.18
        case 30:
            karmaBonus = -0.15
        case 35:
            karmaBonus = -0.12
        case 40:
            karmaBonus = -0.09
        case 45:
            karmaBonus = -0.03
        case 50:
            karmaBonus = 0
        case 55:
            karmaBonus = 0.03
        case 60:
            karmaBonus = 0.09
        case 65:
            karmaBonus = 0.12
        case 70:
            karmaBonus = 0.15
        case 75:
            karmaBonus = 0.18
        case 80:
            karmaBonus = 0.21
        case 85:
            karmaBonus = 0.24
        case 90:
            karmaBonus = 0.27
        case 95:
            karmaBonus = 0.30
        case 100:
            karmaBonus = 0.33
            
        default:
            karmaBonus = 0
        }
       
       let random = Double.random(in: 0..<1)
       return random <= winChance + karmaBonus
   }
    
    enum GameStatus {
        
case firstQ, secondQ, chooseBet, animation, result
        
}
    
}
