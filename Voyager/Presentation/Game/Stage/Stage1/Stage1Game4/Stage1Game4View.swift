import SwiftUI

struct Stage1Game4View: View {
    
    @EnvironmentObject var stage1ViewModel: Stage1ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage1Game4ViewModel = Stage1Game4ViewModel()
    
    var body: some View {
        ZStack {
            switch stage1Game4ViewModel.state {
            case .text0:
                stageView {
                    stage1Game4ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage1Game4ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage1Game4ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage1Game4ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
                    stage1Game4ViewModel.nextText(.text5)
                }
            case .text5:
                stageView {
                    stage1Game4ViewModel.nextText(.game)
                }
            case .game:
                stageView {
                    
                }
            }
        }
        .onAppear {
            stage1ViewModel.setBackImages(
                background: "back",
                character: stage1Game4ViewModel.phraseSource.type.imageName
            )
        }
    }
    
    
    @ViewBuilder private func stageView(nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage1Game4ViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                nextState()
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage1Game4ViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage1Game4ViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage1Game4ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage1Game4ViewModel.phraseSource.text {
            stage1Game4ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage1Game4ViewModel.printingFinished.toggle()
    }
    
}
