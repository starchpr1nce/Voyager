//
//  Stage3PreviewView.swift
//  Voyager
//
//  Created by mnats on 01.12.2023.
//

import SwiftUI

struct Stage3PreviewView: View {
    @EnvironmentObject var stage3ViewModel: Stage3ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage3PreviewViewModel = Stage3PreviewViewModel()
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea(.all)
            Image(stage3PreviewViewModel.phraseSource.type.imageName)
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
            switch stage3PreviewViewModel.state {
            case .text0:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text1)
                }
            case .text1:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text2)
                }
            case .text2:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text3)
                }
            case .text3:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text4)
                }
            case .text4:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text5)
                }
            case .text5:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text6)
                }
            case .text6:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text7)
                }
            case .text7:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text8)
                }
            case .text8:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text9)
                }
            case .text9:
                stageView(src: stage3PreviewViewModel.phraseSource.text) {
                    stage3PreviewViewModel.nextText(.text10)
                }
            case .text10:
                stageViewWithAnswers {
                    stage3ViewModel.setState(.game1)
                } negativeAction: {
                    stage3ViewModel.setState(.game1)
                }
            }
            
        }
    }
    
    @ViewBuilder private func stageView(src: String, nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage3PreviewViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                nextState()
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage3PreviewViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage3PreviewViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage3PreviewViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    @ViewBuilder private func stageViewWithAnswers(customText: String? = nil, positiveAction: @escaping () -> Void, negativeAction: @escaping () -> Void) -> some View {
        VStack {
            Text(customText ?? stage3PreviewViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                positiveAction()
            }, label: {
                Text(stage3PreviewViewModel.phraseSource.answerPositive ?? "")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage3PreviewViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage3PreviewViewModel.printingFinished)
            .padding(.bottom, 2)
            
            Button(action: {
                negativeAction()
            }, label: {
                Text(stage3PreviewViewModel.phraseSource.answerNegative ?? "")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage3PreviewViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage3PreviewViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage3PreviewViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage3PreviewViewModel.phraseSource.text {
            stage3PreviewViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
//                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage3PreviewViewModel.printingFinished.toggle()
    }
}


#Preview {
    Stage3PreviewView()
}
