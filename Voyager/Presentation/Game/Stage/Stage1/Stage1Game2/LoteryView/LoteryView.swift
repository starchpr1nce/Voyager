
import SwiftUI

struct LoteryView: View {
    

    @EnvironmentObject var loteryViewModel: LoteryViewModel
    @EnvironmentObject var stage1ViewModel: Stage1ViewModel
    
    var winChanse = [1,2,3,4,5,6,7,8,9,10].shuffled()

    var body: some View {
        VStack {
            Spacer()
            VStack {
                switch loteryViewModel._gameStatus {
                case .game:
                    gameView()
                case .result:
                    resultView()
                }
            } 
            .padding(.bottom, 32)
        }
    }
    
    func gameView() -> some View {
        VStack {
            if loteryViewModel.firstStep {
                Image("ticket")
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    loteryViewModel.firstStep = false
                                    loteryViewModel.secondStep = true
                                }
                            }
                    )
            } else if loteryViewModel.secondStep {
                Image(winChanse[0] < 6 ? "ticketSemiLose" : "ticketSemiWin")
                    .gesture(
                        DragGesture()
                            .onChanged { _ in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    
                                    loteryViewModel.secondStep = false
                                    loteryViewModel.thirdStep = true
                                }
                            }
                    )
                
            } else if  loteryViewModel.thirdStep {
                Image(winChanse[0] < 6 ? "ticketLose" : "ticketWin")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            loteryViewModel.setResult()
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
    
    func resultView() -> some View {
        VStack {
            Text(winChanse[0] < 6 ?  "В следующий раз повезет" : "Повезло - повезлоо!")
                .gameButtonStyle(.textBack)
            
            Button(action: {
                stage1ViewModel.setState(.game3)
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
            })
            
            Button(action: {}, label: {
                Text("А давай еще один")
                    .gameButtonStyle(.nextButton)
            })
        }
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
}


#Preview {
    LoteryView()
        .environmentObject(LoteryViewModel())
}
