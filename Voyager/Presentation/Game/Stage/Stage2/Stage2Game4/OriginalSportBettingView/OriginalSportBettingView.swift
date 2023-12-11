import SwiftUI

struct OriginalSportBettingView: View {
    
    @EnvironmentObject var originalSportBettingViewModel: OriginalSportBettingViewModel
    
    var body: some View {
        VStack {
            switch originalSportBettingViewModel._gameStatus {
            case .chooseTeam:
                chooseTeamView()
            case .chooseBet:
                chooseBetSizeView()
            case .animation:
                animatingView()
            case .result:
                resultView()
            }
        }
    }
    
    @ViewBuilder private func chooseTeamView() -> some View {
        VStack {
        Spacer()
            VStack {
                Text("Кто выиграет-то?")
                    .gameButtonStyle(.textBack)
                
                Button(action: {
                    originalSportBettingViewModel.playerRate = originalSportBettingViewModel.winRate[0]
                    originalSportBettingViewModel.setChooseBet()
                }, label: {
                    Text("\(originalSportBettingViewModel.teamsArray[0]): \(originalSportBettingViewModel.winRate[0], specifier: "%.1f")")
                        .gameButtonStyle(.nextButton)
                })
                
                Button(action: {
                    originalSportBettingViewModel.playerRate = originalSportBettingViewModel.drawRate[0]
                    originalSportBettingViewModel.setChooseBet()
                }, label: {
                    Text("Ничья: \(originalSportBettingViewModel.drawRate[0], specifier: "%.1f")")
                        .gameButtonStyle(.nextButton)
                })
                
                Button(action: {
                    originalSportBettingViewModel.playerRate = originalSportBettingViewModel.winRate[1]
                    originalSportBettingViewModel.setChooseBet()
                }, label: {
                    Text("\(originalSportBettingViewModel.teamsArray[1]): \(originalSportBettingViewModel.winRate[1], specifier: "%.1f")")
                        .gameButtonStyle(.nextButton)
                })
            } .padding(.bottom, 32)
        } 
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
    
    @ViewBuilder private func chooseBetSizeView() -> some View {
        VStack {
            Spacer()
            VStack {
                Text("Сколько ставим, друг?")
                    .gameButtonStyle(.textBack)
                
                Button(action: {
                    originalSportBettingViewModel.playerBetSize = originalSportBettingViewModel.sizeBet[0]
                    originalSportBettingViewModel.setAnimation()
                }, label: {
                    Text("\(originalSportBettingViewModel.sizeBet[0])")
                        .gameButtonStyle(.nextButton)
                })
                
                Button(action: {
                    originalSportBettingViewModel.playerBetSize = originalSportBettingViewModel.sizeBet[1]
                    originalSportBettingViewModel.setAnimation()
                }, label: {
                    Text("\(originalSportBettingViewModel.sizeBet[1])")
                        .gameButtonStyle(.nextButton)
                })
                
                Button(action: {
                    originalSportBettingViewModel.playerBetSize = originalSportBettingViewModel.sizeBet[2]
                    originalSportBettingViewModel.setAnimation()
                }, label: {
                    Text("\(originalSportBettingViewModel.sizeBet[2])")
                        .gameButtonStyle(.nextButton)
                }) .padding(.bottom, 32)
            }
        } 
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
    
    @ViewBuilder private func animatingView() -> some View {
        VStack {
            Spacer()
            Text("Здесь в моих планах была красивая анимация полета мяча и забития голов, но мне просто не хватило денег что бы оплатить этот труд нашего дизайнера Никиты, поэтому я написал текст который вы все равно не прочтете за 1,5 секунды ))))")
                .gameButtonStyle(.textBack)
                .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        .miniGameBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)  {
                originalSportBettingViewModel.setResult()
            }
        }
    }
    
    @ViewBuilder private func resultView() -> some View {
        let isWin = originalSportBettingViewModel.determineWin()
        
        VStack {
            Spacer()
            Text(isWin ? "С Детства за них болею!! И Сына научу!" : "Кривоногие бездари...")
                .gameButtonStyle(.textBack)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Ладно, давай ещё разок")
                    .gameButtonStyle(.nextButton)
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
            }) 
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity)
        .miniGameBackground()
    }
    
}

#Preview {
    OriginalSportBettingView().environmentObject(OriginalSportBettingViewModel())
}
