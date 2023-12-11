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
    
    @ViewBuilder private func chooseTeamButton(_ rate: Int) -> some View {
        
        Button(action: {
            originalSportBettingViewModel.playerRate = originalSportBettingViewModel.winRate[rate]
            originalSportBettingViewModel.setChooseBet()
        }, label: {
            Text("\(originalSportBettingViewModel.teamsArray[rate]): \(originalSportBettingViewModel.winRate[rate], specifier: "%.1f")")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
        
    }
    
    
    @ViewBuilder private func chooseTeamView() -> some View {
        VStack {
            Spacer()
            VStack {
                Text("Кто выйграет-то?")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.mint.opacity(1))
                    .border(Color.black, width: 2)
                
                
                chooseTeamButton(0)
                
                Button(action: {
                    originalSportBettingViewModel.playerRate = originalSportBettingViewModel.drawRate[0]
                    originalSportBettingViewModel.setChooseBet()
                }, label: {
                    Text("Ничья: \(originalSportBettingViewModel.drawRate[0], specifier: "%.1f")")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 280)
                        .background(Color.orange.opacity(1))
                        .border(Color.black, width: 2)
                })
                chooseTeamButton(1)
                
            } .padding(.bottom, 32)
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
    
    
    @ViewBuilder private func chooseSizeBetButton(_ sizeBet: Int) -> some View {
        Button(action: {
            originalSportBettingViewModel.playerBetSize = originalSportBettingViewModel.sizeBet[sizeBet]
            originalSportBettingViewModel.setAnimation()
        }, label: {
            Text("\(originalSportBettingViewModel.sizeBet[sizeBet])")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
    }
    
    @ViewBuilder private func chooseBetSizeView() -> some View {
        VStack {
            Spacer()
            VStack {
                Text("Сколько ставим, друг?")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 280)
                    .background(Color.mint.opacity(1))
                    .border(Color.black, width: 2)
                
                chooseSizeBetButton(0)
                chooseSizeBetButton(1)
                chooseSizeBetButton(2)
                    .padding(.bottom, 32)
                
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
    
    @ViewBuilder private func animatingView() -> some View {
        VStack {
            Spacer()
            Text("Здесь в моих планах была красивая анимация полета мяча и забития голов, но мне просто не хватило денег что бы оплатить этот труд нашего дизайнера Никиты, поэтому я написал текст который вы все равно не прочтете за 1,5 секунды ))))")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
                .padding(.bottom,32)
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)  {
                    originalSportBettingViewModel.setResult()
                }
            }
    }
    
    @ViewBuilder private func resultViewButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text("\(text)")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.orange.opacity(1))
                .border(Color.black, width: 2)
        })
    }
    
    @ViewBuilder private func resultView() -> some View {
        let isWin = originalSportBettingViewModel.determineWin()
        
        VStack {
            Spacer()
            Text(isWin ? "С Детства за них болею!! И Сына научу!" : "Кривоногие бездари...")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: 280)
                .background(Color.mint.opacity(1))
                .border(Color.black, width: 2)
            
            
            resultViewButton("Ладно, давай ещё разок") {
                originalSportBettingViewModel.setChooseTeam()
            }
            resultViewButton("Дальше") {
                
            } .padding(.bottom, 32)
            
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
    
}
