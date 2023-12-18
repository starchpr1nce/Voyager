
import Combine
import SwiftUI
import Foundation

final class LoteryViewModel: ObservableObject {
    
    @Published private(set) var _gameStatus: GameStatus = .game
    
    @Published var numberHidden = true
    
    @Published var firstStep =  true
    @Published var secondStep = false
    @Published var thirdStep = false
    
    lazy var isWin = determineWin()
    
    
//    var winChanse = [1,2,3,4,5,6,7,8,9,10].shuffled()
    
    func determineWin() -> Bool {
       let winChance: Double
       
        switch StorageManager.shared.gameKarma {
        case 0:
            winChance = 0.03
        case 5:
            winChance = 0.05
        case 10:
            winChance = 0.10
        case 15:
            winChance = 0.15
        case 20:
            winChance = 0.20
        case 25:
            winChance = 0.25
        case 30:
            winChance = 0.30
        case 35:
            winChance = 0.35
        case 40:
            winChance = 0.40
        case 45:
            winChance = 0.45
        case 50:
            winChance = 0.50
        case 55:
            winChance = 0.55
        case 60:
            winChance = 0.60
        case 65:
            winChance = 0.65
        case 70:
            winChance = 0.70
        case 75:
            winChance = 0.75
        case 80:
            winChance = 0.80
        case 85:
            winChance = 0.85
        case 90:
            winChance = 0.90
        case 95:
            winChance = 0.95
        case 100:
            winChance = 0.97

       default:
           winChance = 0.01
       }
       
       let random = Double.random(in: 0..<1)
       return random <= winChance

   }
    
    func setGame() {
        _gameStatus = .game
        firstStep =  true
        secondStep = false
        thirdStep = false
        isWin = determineWin()
        
    }
    func setResult() {
        _gameStatus = .result
    }
    
    enum GameStatus {
        case game
        case result
    }
}
