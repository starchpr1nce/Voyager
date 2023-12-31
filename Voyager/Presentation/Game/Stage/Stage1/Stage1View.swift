//
//  Stage1View.swift
//  Voyager
//
//  Created by admin on 23.11.2023.
//

import SwiftUI

struct Stage1View: View {
    
    @EnvironmentObject var stageViewModel: Stage1ViewModel
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    @EnvironmentObject var currentStageState: NavRouter<CurrentStageState>
    //
    var body: some View {
        ZStack {
            Image(stageViewModel.background)
                .resizable()
                .ignoresSafeArea(.all)
            if !stageViewModel.character.isEmpty {
                Image(stageViewModel.character)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
            }
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

            switch stageViewModel.stageState {
            case .preview:
                Stage1PreviewView()
            case .game1:
                Stage1Game1View()
            case .game2:
                Stage1Game2View()
            case .game3:
                Stage1Game3View()
            case .game4:
                Stage1Game4View()
            case .freePlay:
                Stage1FreeplayView()
                    .environmentObject(currentStageState)
            }
        }
        .environmentObject(stageViewModel)
        
    }
}
