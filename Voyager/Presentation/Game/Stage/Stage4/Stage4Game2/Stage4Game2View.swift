//
//  Stage4Game2View.swift
//  Voyager
//
//  Created by mnats on 04.12.2023.
//

import SwiftUI

struct Stage4Game2View: View {
    @EnvironmentObject var stage3ViewModel: Stage3ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage4Game2ViewModel = Stage4Game2ViewModel()
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea(.all)
            Image(stage4Game2ViewModel.phraseSource.type.imageName)
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
            switch stage4Game2ViewModel.state {
            case .text0:
                stageView {
                    stage4Game2ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage4Game2ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage4Game2ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage4Game2ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
                    stage4Game2ViewModel.nextText(.text5)
                }
            case .text5:
                stageView {
                    stage4Game2ViewModel.nextText(.text6)
                }
            case .text6:
                stageView {
                    stage4Game2ViewModel.nextText(.text7)
                }
            case .text7:
                stageView {
                    stage4Game2ViewModel.nextText(.text8)
                }
            case .text8:
                stageView {
                    stage4Game2ViewModel.nextText(.text9)
                }
            case .text9:
                stageView {
                    stage4Game2ViewModel.nextText(.text10)
                }
            case .text10:
                stageView {
                    stage4Game2ViewModel.nextText(.text11)
                }
            case .text11:
                stageView {
                    stage4Game2ViewModel.nextText(.text12)
                }
            case .text12:
                stageView {
                    stage4Game2ViewModel.nextText(.text13)
                }
            case .text13:
                stageViewWithAnswers {
                    stage3ViewModel.setState(.game3)
                } negativeAction: {
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
            Text(stage4Game2ViewModel.textOutput)
                .padding(12)
                .foregroundStyle(.white)
                .font(.system(size: 14).monospaced().weight(.bold))
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .topLeading)
                .multilineTextAlignment(.leading)
                .background(Color(.textBack))
                .border(Color.black, width: 2)
                .padding(.bottom, 2)
            
            Button(action: {
                nextState()
                //                stage1ViewModel.setState(.game1)
            }, label: {
                Text("Дальше")
                    .padding(12)
                    .foregroundStyle(.white)
                    .opacity(stage4Game2ViewModel.printingFinished ? 0.3 : 1.0)
                    .font(.system(size: 18).monospaced().weight(.bold))
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color(.nextButton))
                    .border(Color.black, width: 2)
            })
            .disabled(stage4Game2ViewModel.printingFinished)
            .padding(.bottom)
            
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                stage4Game2ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    @ViewBuilder private func stageViewWithAnswers(customText: String? = nil, positiveAction: @escaping () -> Void, negativeAction: @escaping () -> Void) -> some View {
        VStack {
            Text(customText ?? stage4Game2ViewModel.textOutput)
                .padding(12)
                .foregroundStyle(.white)
                .font(.system(size: 14).monospaced().weight(.bold))
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .topLeading)
                .multilineTextAlignment(.leading)
                .background(Color(.textBack))
                .border(Color.black, width: 2)
                .padding(.bottom, 2)
            
            Button(action: {
                positiveAction()
            }, label: {
                Text(stage4Game2ViewModel.phraseSource.answerPositive ?? "")
                    .padding(12)
                    .foregroundStyle(.white)
                    .opacity(stage4Game2ViewModel.printingFinished ? 0.3 : 1.0)
                    .font(.system(size: 18).monospaced().weight(.bold))
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color(.nextButton))
                    .border(Color.black, width: 2)
            })
            .disabled(stage4Game2ViewModel.printingFinished)
            .padding(.bottom, 2)
            
            Button(action: {
                negativeAction()
            }, label: {
                Text(stage4Game2ViewModel.phraseSource.answerNegative ?? "")
                    .padding(12)
                    .foregroundStyle(.white)
                    .opacity(stage4Game2ViewModel.printingFinished ? 0.3 : 1.0)
                    .font(.system(size: 18).monospaced().weight(.bold))
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color(.nextButton))
                    .border(Color.black, width: 2)
            })
            .disabled(stage4Game2ViewModel.printingFinished)
            .padding(.bottom)
            
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                stage4Game2ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage4Game2ViewModel.phraseSource.text {
            stage4Game2ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: 5_000_000)
            }
        }
        stage4Game2ViewModel.printingFinished.toggle()
    }
    
}


