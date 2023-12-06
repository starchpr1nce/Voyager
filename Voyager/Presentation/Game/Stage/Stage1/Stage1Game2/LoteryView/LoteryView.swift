
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
            } .padding(.bottom, 32)

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
            }  else if loteryViewModel.secondStep {
                

//                RoundedRectangle (cornerRadius: 10)
//                    .fill(Color.yellow)
//                    .frame(width: 200, height: 100)
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
                
//                RoundedRectangle (cornerRadius: 10)
//                    .fill(Color.green)
//                    .frame(width: 200, height: 100)
                Image(winChanse[0] < 6 ? "ticketLose" : "ticketWin")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                loteryViewModel.setResult()
                            }
                        }
            }
            
        } .frame(maxWidth: .infinity)
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
    }
    
    func resultView() -> some View {
        
        VStack {
            
            Text(winChanse[0] < 6 ?  "В следующий раз повезет" : "Повезло - повезлоо!")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
            
            Button(action: {
                stage1ViewModel.setState(.game3)
            }, label: {
                Text("Дальше")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.orange.opacity(1))
                    .border(Color.black, width: 2)
            })
            
            Button(action: {}, label: {
                Text("А давай еще один")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.orange.opacity(1))
                    .border(Color.black, width: 2)
            })
        }
    }
    
}


#Preview {
    LoteryView().environmentObject(LoteryViewModel())
}
