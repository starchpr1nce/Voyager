//
//  WheelGameStateView.swift
//  Voyager
//
//  Created by admin on 12.12.2023.
//

import SwiftUI

struct WheelGameStateView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    var body: some View {
        Image("wheel_back")
            .resizable()
            .ignoresSafeArea(.all)
        VStack {
            Image("wheel_arrow")
                .resizable()
                .frame(width: 50, height: 30)
        Image("wheel")
            .resizable()
            .frame(width: 300, height: 300)
            .rotationEffect(.degrees(wheelViewModel.angle))
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    if #available(iOS 17.0, *) {
                        withAnimation(.easeOut(duration: wheelViewModel.timeRemaining)) {
                            wheelViewModel.angle = Double.random(in: 900.0...3000.0)
                        }
                    completion: {
                        let finishAngle = wheelViewModel.angle / 360.0
                        let remains = finishAngle.truncatingRemainder(dividingBy: 1.0)
                        let resultAngle = remains * 360.0
                        let result = wheelViewModel.getRW(result: resultAngle)
                        wheelViewModel.resultGameRWData = result
                        let amountResult = wheelViewModel.calculateGameResult(
                            amount: wheelViewModel.amount,
                            selectType: wheelViewModel.selectType,
                            result: result,
                            colorSelect: wheelViewModel.colorSelect,
                            numSelect: wheelViewModel.numSelect
                        )
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            wheelViewModel.setResultScene(amountResult)
                        })
                    }
                    } else {
                        withAnimation(.easeOut(duration: wheelViewModel.timeRemaining)) {
                            wheelViewModel.angle = Double.random(in: 900.0...3000.0)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + wheelViewModel.timeRemaining) {
                            let finishAngle = wheelViewModel.angle / 360.0
                            let remains = finishAngle.truncatingRemainder(dividingBy: 1.0)
                            let resultAngle = remains * 360.0
                            let result = wheelViewModel.getRW(result: resultAngle)
                            wheelViewModel.resultGameRWData = result
                            let amountResult = wheelViewModel.calculateGameResult(
                                amount: wheelViewModel.amount,
                                selectType: wheelViewModel.selectType,
                                result: result,
                                colorSelect: wheelViewModel.colorSelect,
                                numSelect: wheelViewModel.numSelect
                            )
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                wheelViewModel.setResultScene(amountResult)
                            })
                        }
                    }
                })
         
            }
    }
}
