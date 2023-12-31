//
//  Stage4Game4View.swift
//  Voyager
//
//  Created by mnats on 04.12.2023.
//

import SwiftUI

struct Stage4Game4View: View {
    @EnvironmentObject var stage4ViewModel: Stage4ViewModel
    @StateObject var stage4Game4ViewModel = Stage4Game4ViewModel()
    var body: some View {
        ZStack {
            switch stage4Game4ViewModel.state {
            case .text0:
                stageView {
                    stage4Game4ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage4Game4ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage4Game4ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage4Game4ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
                    stage4Game4ViewModel.nextText(.text5)
                }
            case .text5:
                stageView {
                    stage4Game4ViewModel.nextText(.text6)
                }
            case .text6:
                stageView {
                    stage4Game4ViewModel.nextText(.game)
                }
            case .game:
                stageView {
                    stage4ViewModel.setState(.preview)
                }
            }
            
        }
        .onAppear {
            stage4ViewModel.setBackImages(
                background: "back",
                character: stage4Game4ViewModel.phraseSource.type.imageName
            )
        }
        .onChange(of: stage4Game4ViewModel.state) { _ in
            stage4ViewModel.setBackImages(
                background: "back",
                character: stage4Game4ViewModel.phraseSource.type.imageName
            )
        }
    }
    
    @ViewBuilder private func stageView(nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage4Game4ViewModel.textOutput)
                .gameTextStyle(.textBack)
                .padding(.bottom, 2)
            
            Button(action: {
                nextState()
                //                stage1ViewModel.setState(.game1)
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage4Game4ViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage4Game4ViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage4Game4ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage4Game4ViewModel.phraseSource.text {
            stage4Game4ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage4Game4ViewModel.printingFinished.toggle()
    }
    
}


