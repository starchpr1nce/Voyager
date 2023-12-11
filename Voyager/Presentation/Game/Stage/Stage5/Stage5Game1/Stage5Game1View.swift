import SwiftUI

struct Stage5Game1View: View {
    
    @EnvironmentObject var stage5ViewModel: Stage5ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage5Game1ViewModel = Stage5Game1ViewModel()
    
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea(.all)
            Image(stage5Game1ViewModel.phraseSource.type.imageName)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            VStack {
                HStack {
                    Button(action: {
                        appRouter.pop()
                    }, label: {
                        Image("backArrow")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .padding()
                    })
                    Spacer()
                }
                Spacer()
            }
            
            switch stage5Game1ViewModel.state {
            case .text0:
                stageView {
                    stage5Game1ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage5Game1ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage5Game1ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage5Game1ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
                    stage5Game1ViewModel.nextText(.text5)
                }
            case .text5:
                stageView {
                    stage5Game1ViewModel.nextText(.text6)
                }
            case .text6:
                stageView {
                    stage5Game1ViewModel.nextText(.text7)
                }
            case .text7:
                stageView {
                    stage5Game1ViewModel.nextText(.text8)
                }
            case .text8:
                stageView {
                    stage5Game1ViewModel.nextText(.text9)
                }
            case .text9:
                stageView {
                    stage5Game1ViewModel.nextText(.text10)
                }
            case .text10:
                stageView {
//                    stage5Game1ViewModel.nextText(.game)
                    stage5ViewModel.setState(.game2)
                }
            case .game:
                stageView {
                    
                }
            }
        }
    }
    
    @ViewBuilder private func stageView(nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage5Game1ViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                nextState()
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage5Game1ViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage5Game1ViewModel.printingFinished)
            .padding(.bottom)
            
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
            stage5Game1ViewModel.printingFinished.toggle()
            Task {
                try await writeTextBySymbols()
            }
        }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage5Game1ViewModel.phraseSource.text {
            stage5Game1ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage5Game1ViewModel.printingFinished.toggle()
    }
    
    
}
