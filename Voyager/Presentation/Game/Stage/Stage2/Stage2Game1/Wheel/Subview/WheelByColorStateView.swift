//
//  WheelByColorStateView.swift
//  Voyager
//
//  Created by admin on 12.12.2023.
//

import SwiftUI

struct WheelByColorStateView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    var body: some View {
        VStack {
        Text("На какой цвет ставишь?")
            .gameButtonStyle(.textBack)
        VStack {
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .red)
            }, label: {
                Text("Красный")
                    .gameButtonStyle(.nextButton)
            })
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .black)
            }, label: {
                Text("Черный")
                    .gameButtonStyle(.nextButton)
            })
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .green)
            }, label: {
                Text("Зеленый")
                    .gameButtonStyle(.nextButton)
            })
        }
        .padding(.bottom, 32)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .miniGameBackground()
    }
}
