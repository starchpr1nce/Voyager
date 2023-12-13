import Combine

final class Stage1Game3ViewModel: ObservableObject {
    
    @Published var state: Stage1GameState = .text0
    @Published var textOutput = ""
    @Published var phraseSource = Stage1RPSReference.shared.phrases[0]
    @Published var printingFinished = false
    @Published var index = 0
    
    @Published var crossPut = false
    
    enum  Stage1GameState {
        case text0, text1, text2, text3,text4, text5, text6, game
    }
    
    
    func nextText(_ state: Stage1GameState) {
        if index < Stage1RPSReference.shared.phrases.count - 1 {
            self.state = state
            index += 1
            textOutput = ""
            phraseSource = Stage1RPSReference.shared.phrases[index]
        } else {
            textOutput = ""
            self.state = state
        }
    }
    
}
