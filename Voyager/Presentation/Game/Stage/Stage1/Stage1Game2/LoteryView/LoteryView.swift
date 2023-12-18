
import SwiftUI

struct LoteryView: View {
    

    @EnvironmentObject var loteryViewModel: LoteryViewModel
    @EnvironmentObject var stage1ViewModel: Stage1ViewModel
    

    
    
    
    var completion = {}

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
    
  @ViewBuilder private func gameView() -> some View {
        
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
            }  else if loteryViewModel.secondStep {
                
//                Image(loteryViewModel.winChanse[0] < 6 ? "ticketSemiLose" : "ticketSemiWin")
                Image(loteryViewModel.isWin ? "ticketSemiLose" : "ticketSemiWin")
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
                Image(loteryViewModel.isWin ? "ticketLose" : "ticketWin")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            loteryViewModel.setResult()
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
            .background {
                        ZStack {
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .frame(height: 5)
                                Rectangle()
                                    .foregroundStyle(Color(red: 0.13, green: 0.14, blue: 0.19))
                                    .frame(height: UIScreen.main.bounds.height * 0.4)
                            }
                        }.ignoresSafeArea()
                    }
            
        
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    } // View
    
    @ViewBuilder private func resultViewButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button(action: {
           action()
        }, label: {
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
    }
    
    @ViewBuilder private func resultView() -> some View {
        
        
        VStack {
            Text(loteryViewModel.isWin ?  "В следующий раз повезет" : "Повезло - повезлоо!")
                .gameButtonStyle(.textBack)
           
            Button(action: {
                completion()
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
            })
            
            Button(action: {
                loteryViewModel.setGame()
            }, label: {
                Text("А давай еще один")
                    .gameButtonStyle(.nextButton)
            })
        }
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
}

//#Preview {
//    LoteryView()
//        .environmentObject(LoteryViewModel())
//}

