//
//  AppRouter.swift
//  Voyager
//
//  Created by admin on 27.11.2023.
//
//MARK: - Upd

import SwiftUI

struct AppRouter: View {
    @StateObject private var appNavRouter = NavRouter<AppRouteState>(route: StorageManager.shared.onboardingPresented ? .main : .onboarding)
    
    var body: some View {
        ZStack {
            
//                Color.red.ignoresSafeArea(.all)
            Image("backPreview")
                .resizable()
                .ignoresSafeArea(.all)
        
            Group {
                
                switch appNavRouter.route {
                case .onboarding:
//                    Button(action: {
//                        appNavRouter.push(route: .main)
//                        StorageManager.shared.toggleOnboarding()
//                    }, label: {
//                        Text("skip onboarding")
//                    })
                    OnboardingView()
                        .environmentObject(appNavRouter)
                        .environmentObject(OnboardingViewModel())

                case .game:
                    GameView()
                        .environmentObject(appNavRouter)
                case .info:
                    InfoView()
                        .environmentObject(appNavRouter)
                case .settings:
                    SettingsView()
                        .environmentObject(appNavRouter)
                case .textSize:
                    TextSizeView()
                        .environmentObject(appNavRouter)
                case .textSpeed:
                    TextSpeedView()
                        .environmentObject(appNavRouter)
                case .privacy:
                    PolicyView()
                        .environmentObject(appNavRouter)
                case .aboutUs:
                    AboutUsView()
                        .environmentObject(appNavRouter)
                    
                default:
                    MainView()
                        .environmentObject(ViewModelFactory.shared.makeMainViewModel())
                        .environmentObject(appNavRouter)
                        .transition(.move(edge: .trailing))
                }
            }
//            .transition(.scale)
        }
        
    }
}

enum AppRouteState: NavHost {
    case onboarding
    case main
    case game
    case info
    case settings
    case textSpeed
    case textSize
    case privacy
    case aboutUs
}
enum GameStageState: String, NavHost {
    case preview
    case game1
    case game2
    case game3
    case game4
    case freePlay
}

enum CurrentStageState: String, NavHost {
    case stage1
    case stage2
    case stage3
    case stage4
    case stage5
    
    var value: String {
        switch self {
        case .stage1:
            return "Глава 1"
        case .stage2:
            return "Глава 2"
        case .stage3:
            return "Глава 3"
        case .stage4:
            return "Глава 4"
        case .stage5:
            return "Глава 5"
        }
    }
}
