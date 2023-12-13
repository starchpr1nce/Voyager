//
//  WheelSetupTypeStateView.swift
//  Voyager
//
//  Created by admin on 12.12.2023.
//

import SwiftUI

struct WheelSetupTypeStateView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    var body: some View {
        VStack {
            Text("На что ставишь?")
                .gameButtonStyle(.textBack)
            VStack {
                Button(action: {
                    wheelViewModel.setByColorState()
                }, label: {
                    Text("На цвет")
                        .gameButtonStyle(.nextButton)
                })
                Button(action: {
                    wheelViewModel.setByNumState()
                }, label: {
                    Text("На число")
                        .gameButtonStyle(.nextButton)
                })
                Button(action: {
                    wheelViewModel.setByBothState()
                }, label: {
                    Text("На оба")
                        .gameButtonStyle(.nextButton)
                })
            }
            .padding(.bottom, 32)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .miniGameBackground()
    }
}
