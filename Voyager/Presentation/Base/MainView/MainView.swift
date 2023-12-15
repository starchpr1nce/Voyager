//
//  MainView.swift
//  Voyager
//
//  Created by admin on 20.11.2023.
//

//MARK: - Upd

import SwiftUI
import UIPilot

struct MainView: View {
//    @EnvironmentObject var pilot: UIPilot<String>
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    
    var currentStage: CurrentStageState = StorageManager.shared.currentStageState

    
    

    var body: some View {
        
        ZStack {
            
            Image("backPreview")
                .resizable()
                .ignoresSafeArea(.all)
            Image("mc")
                .resizable()
                .scaledToFit()
            
            VStack {
                switch mainViewModel._gameStatus {
                case .newGame:
                    newGameView()
                case .continueGame:
                    continueGameView()
                }
            }
        }
    }
    
    @ViewBuilder private func newGameView() -> some View {
        VStack {
            
            Text(currentStage.value)
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Spacer()
            

                mainButtomView("Новая игра") {
                    appRouter.push(route: .game)
                }
                
                mainButtomView("Информация") {
                    appRouter.push(route: .info)
                }
                
                mainButtomView("Настройки", action: {
                    appRouter.push(route: .settings)
                })

            .padding(.bottom, 150)

        }
    }
    
    @ViewBuilder private func continueGameView() -> some View {
        VStack {
         
            Spacer()
            
            
            
            mainButtomView("Продолжить") {
                appRouter.push(route: .game)
            }
            
            mainButtomView("Информация") {
                appRouter.push(route: .info)
            }
            
            mainButtomView("Настройки", action: {
                appRouter.push(route: .settings)
            })
                .padding(.bottom, 100)
            .padding(.bottom, 100)
        }
    }
    
    @ViewBuilder private func mainButtomView(_ text: String, action: @escaping() -> Void ) -> some View {
        Button(action: {
            action()
        }, label: {
            Text(text)
                .frame(height: 40)
                .font(.system(size: 24))
                .padding(3)
                .foregroundStyle(.white)
                .font(.system(size: 18).monospaced().weight(.bold))
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .background(.nextButton)
                .border(Color.black, width: 2)
        })

    }
    
}






//Button(action: {
//    appRouter.push(route: .game)
//    
//}, label: {
//    Text("Game")
//})
//Button(action: {
//    appRouter.push(route: .info)
//}, label: {
//    Text("info")
//})
//Button(action: {
//    StorageManager.shared.setStage1State(.preview)
//    StorageManager.shared.setStage2State(.preview)
//    StorageManager.shared.setStage3State(.preview)
//    StorageManager.shared.setStage4State(.preview)
//    StorageManager.shared.setStage5State(.preview)
//    StorageManager.shared.setCurrentStage(.stage1)
//}, label: {
//    Text("reset")
//})
