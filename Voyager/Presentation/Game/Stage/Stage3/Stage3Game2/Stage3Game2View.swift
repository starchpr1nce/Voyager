//
//  Stage3Game2View.swift
//  Voyager
//
//  Created by mnats on 04.12.2023.
//

import SwiftUI

struct Stage3Game2View: View {
    @EnvironmentObject var stage3ViewModel: Stage3ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage3Game2ViewModel = Stage3Game2ViewModel()
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea(.all)
            Image(stage3Game2ViewModel.phraseSource.type.imageName)
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
            switch stage3Game2ViewModel.state {
            case .text0:
                stageView {
                    stage3Game2ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage3Game2ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage3Game2ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage3Game2ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
//                    stage3Game2ViewModel.nextText(.game)
                    stage3ViewModel.setState(.game3)
                }
            case .game:
                stageView {
                    stage3ViewModel.setState(.preview)
                }
            }
            
        }
    }
    
    @ViewBuilder private func stageView(nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage3Game2ViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                nextState()
                //                stage1ViewModel.setState(.game1)
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage3Game2ViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage3Game2ViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage3Game2ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage3Game2ViewModel.phraseSource.text {
            stage3Game2ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage3Game2ViewModel.printingFinished.toggle()
    }
    
}

