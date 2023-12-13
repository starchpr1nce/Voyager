//
//  WheelView.swift
//  Voyager
//
//  Created by admin on 20.11.2023.
//

import SwiftUI

struct WheelView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    var completion: () -> Void = {}
    var body: some View {
        ZStack {
                switch wheelViewModel.sceneState {
                case .betState:
                    WheelBetStateView()
                case .setupTypeState:
                    WheelSetupTypeStateView()
                case .byColorState:
                    WheelByColorStateView()
                case .byNumState:
                    WheelByNumStateView()
                case .byBothState:
                    WheelByBothStateView()
                case .game:
                    WheelGameStateView()
                case .result:
                    WheelResultStateView() {
                        completion()
                    }
                }

        }.environmentObject(wheelViewModel)
    }
}

//#Preview {
//    WheelView().environmentObject(WheelViewModel())
//}












