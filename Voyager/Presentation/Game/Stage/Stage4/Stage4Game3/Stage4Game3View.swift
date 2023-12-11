//
//  Stage4Game3View.swift
//  Voyager
//
//  Created by mnats on 04.12.2023.
//

import SwiftUI

struct Stage4Game3View: View {
    @EnvironmentObject var stage4ViewModel: Stage4ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @StateObject var stage4Game3ViewModel = Stage4Game3ViewModel()
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea(.all)
            Image(stage4Game3ViewModel.phraseSource.type.imageName)
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
            switch stage4Game3ViewModel.state {
            case .text0:
                stageView {
                    stage4Game3ViewModel.nextText(.text1)
                }
            case .text1:
                stageView {
                    stage4Game3ViewModel.nextText(.text2)
                }
            case .text2:
                stageView {
                    stage4Game3ViewModel.nextText(.text3)
                }
            case .text3:
                stageView {
                    stage4Game3ViewModel.nextText(.text4)
                }
            case .text4:
                stageView {
                    stage4Game3ViewModel.nextText(.text5)
                }
            case .text5:
                stageView {
                    stage4Game3ViewModel.nextText(.text6)
                }
            case .text6:
                stageView {
                    stage4Game3ViewModel.nextText(.text7)
                }
            case .text7:
                stageView {
                    stage4Game3ViewModel.nextText(.game)
                }
            case .game:
                SlotMashineView().environmentObject(SlotMashineViewModel())
            }
            
        }
    }
    
    @ViewBuilder private func stageView(nextState: @escaping () -> Void) -> some View {
        VStack {
            Text(stage4Game3ViewModel.textOutput)
                .gameButtonStyle(.textBack)
            
            Button(action: {
                nextState()
                //                stage1ViewModel.setState(.game1)
            }, label: {
                Text("Дальше")
                    .gameButtonStyle(.nextButton)
                    .opacity(stage4Game3ViewModel.printingFinished ? 0.3 : 1.0)
            })
            .disabled(stage4Game3ViewModel.printingFinished)
            .padding(.bottom)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
                stage4Game3ViewModel.printingFinished.toggle()
                Task {
                    try await writeTextBySymbols()
                }
                
            }
    }
    
    func writeTextBySymbols() async throws {
        for char in stage4Game3ViewModel.phraseSource.text {
            stage4Game3ViewModel.textOutput += String(char)
            if char != " " {
                try await Task.sleep(nanoseconds: Constant.delay)
            }
        }
        stage4Game3ViewModel.printingFinished.toggle()
    }
    
}


