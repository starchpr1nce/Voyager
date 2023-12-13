//
//  WheelComplicatedView.swift
//  Voyager
//
//  Created by admin on 23.11.2023.
//

import SwiftUI

struct WheelComplicatedView: View {
    @EnvironmentObject var wheelComplicatedViewModel: WheelComplicatedViewModel
    var completion: () -> Void = {}
    var body: some View {
        ZStack {
            switch wheelComplicatedViewModel.sceneState {
            case .betState:
                WheelComplicatedBetStateView()
            case .setupTypeState:
                WheelComplicatedSetupTypeStateView()
            case .byColorState:
                WheelComplicatedByColorStateView()
            case .byNumState:
                WheelComplicatedByNumStateView()
            case .byBothState:
                WheelComplicatedByBothStateView()
            case .game:
                WheelComplicatedGameStateView()
            case .result:
                WheelComplicatedResultStateView() {
                    completion()
                }
            }
        }
        .environmentObject(wheelComplicatedViewModel)
    }
}
