//
//  WheelByBothStateView.swift
//  Voyager
//
//  Created by admin on 12.12.2023.
//

import SwiftUI

struct WheelByBothStateView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    @State var mNum = Int.random(in: 0...36)
    var body: some View {
        VStack {
        Text("На что ставишь?")
            .gameButtonStyle(.textBack)
        VStack {
            HStack {
                Button(action: {
                    if mNum > 0 {
                        mNum -= 1
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 15, height: 20)
                        .foregroundStyle(.white)
                        .gameButtonStyle(.nextButton, width: UIScreen.main.bounds.width * 0.2)
                })
                Text("\(mNum)")
                    .gameButtonStyle(.nextButton, width: UIScreen.main.bounds.width * 0.45)
                
                Button(action: {
                    if mNum < 36 {
                        mNum += 1
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 15, height: 20)
                        .foregroundStyle(.white)
                        .gameButtonStyle(.nextButton, width: UIScreen.main.bounds.width * 0.2)
                })
            }
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .red, num: mNum)
            }, label: {
                Text("Красный")
                    .gameButtonStyle(.nextButton)
            })
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .black, num: mNum)
            }, label: {
                Text("Черный")
                    .gameButtonStyle(.nextButton)
            })
            Button(action: {
                wheelViewModel.setGameScene(selectType: .byColor, color: .green, num: mNum)
            }, label: {
                Text("Зеленый")
                    .gameButtonStyle(.nextButton)
            })
        }
        .padding(.bottom, 16)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .miniGameBackground()
    }
}
