//MARK: - UPD
import SwiftUI

struct MexicoHippodromView: View {
    
    @EnvironmentObject var mexicoHippodtromViewModel: MexicoHippodromViewModel
    
    var body: some View {
        VStack {
            switch mexicoHippodtromViewModel._gameStatus {
            case .chooseHorse:
                chooseHorseView()
            case .chooseSizeOfBet:
                chooseSizeOfBet()
            case .animation:
                animationView()
            case .result:
                resultView()
            }
        }
    }
    
    @ViewBuilder private func chooseHorseView() -> some View {
        Spacer()
        VStack {
            Text("Кто твой фаворит  сегодня: ")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
            
            ForEach(0..<4) { index in
                chooseHorseButtonView(index)
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
                                    .frame(height: UIScreen.main.bounds.height * 0.5)
                            }
                        }.ignoresSafeArea()
                    }
            .padding(.bottom, 2)
        
    }
    
    
    @ViewBuilder private func chooseHorseButtonView(_ index: Int) -> some View {
        Button(action: {
            mexicoHippodtromViewModel.selectedRate = mexicoHippodtromViewModel.horsesRate[index]
            mexicoHippodtromViewModel.setChooseSizeOfBet()
        }, label: {
            Text("\(mexicoHippodtromViewModel.horsesNames[index]) (\(mexicoHippodtromViewModel.horsesRate[index], specifier: "%.1f"))")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
    }
    
    
    @ViewBuilder private func chooseSizeOfBet() -> some View {
        
        VStack {
            Spacer()
            
            Text("Рзамер ставки: ")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
            
            ForEach(0..<4) { index in
                chooseSizeOfBetButtonView(index)
            }
            
        } .padding(.bottom, 2)
        .frame(maxWidth: .infinity)
                .background {
                            ZStack {
                                VStack(spacing: 0) {
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 5)
                                    Rectangle()
                                        .foregroundStyle(Color(red: 0.13, green: 0.14, blue: 0.19))
                                        .frame(height: UIScreen.main.bounds.height * 0.5)
                                }
                            }.ignoresSafeArea()
                        }
                
        
        
    }
    
    @ViewBuilder private func chooseSizeOfBetButtonView(_ index: Int) -> some View {
        Button(action: {
            mexicoHippodtromViewModel.selectedBetSize  = mexicoHippodtromViewModel.sizeOfBet[index]
            mexicoHippodtromViewModel.setAnimation()
        }, label: {
            Text("\(mexicoHippodtromViewModel.sizeOfBet[index])")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
    }
    
    
    
    @ViewBuilder private func animationView() -> some View {
        
        ZStack {
            Image("phonk")
 
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()

            
            
            VStack {
                Spacer()
                AnimatedHorseView()
                Spacer()
                AnimatedHorseView()
                Spacer()
                AnimatedHorseView()
                Spacer()
                AnimatedHorseView()
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    mexicoHippodtromViewModel.setResult()
                }
            }
        }
        
    }
    
    @ViewBuilder private func resultView() -> some View {
        let isWin = mexicoHippodtromViewModel.determineWine()
        
        VStack {
          Spacer()
            
            Text(isWin ? "С победой, хлопец" : "Деньги это лишь грязные зеленые бумажки избавляясь от них ты очищаешь свою душу, а я благородно забираю твой грех на себя. Можешь не благодарить")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
            
            Button {
                
            } label: {
                Text("Ещё разок?")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.orange.opacity(1))
                    .border(Color.black, width: 2)
            }
            
            Button {
                
            } label: {
                Text("Дальше")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.orange.opacity(1))
                    .border(Color.black, width: 2)
            } .padding(.bottom, 52)
            
        } .frame(maxWidth: .infinity)
            .background {
                        ZStack {
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .frame(height: 5)
                                Rectangle()
                                    .foregroundStyle(Color(red: 0.13, green: 0.14, blue: 0.19))
                                    .frame(height: UIScreen.main.bounds.height * 0.5)
                            }
                        }.ignoresSafeArea()
                    }
        
    }
    
    
    
}


struct AnimatedHorseView: View {
    @State private var move = false
    @State private var speedMultiplier = Double.random(in: 0.2...0.5)
    
    var body: some View {
        Image("horse")
            .resizable()
            .frame(width: 80, height: 80)
            .offset(x: move ? UIScreen.main.bounds.width - 5 : -150)
        
            .animation (
                Animation.easeInOut(duration: Double.random(in: 1.5...2.6) / speedMultiplier)
            )
            .onAppear {
                withAnimation {
                    self.move.toggle()
                }
            }
    }
}


#Preview {
    MexicoHippodromView().environmentObject(MexicoHippodromViewModel())
}
