//
//  WheelComplicatedGameStateView.swift
//  Voyager
//
//  Created by admin on 13.12.2023.
//

import SwiftUI

struct WheelComplicatedGameStateView: View {
    @EnvironmentObject var wheelComplicatedViewModel: WheelComplicatedViewModel
    var body: some View {
        Image("wheel_back")
            .resizable()
            .ignoresSafeArea(.all)
        ZStack {
            Image("wheel")
                .resizable()
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(wheelComplicatedViewModel.wheelAngle))
            Image("wheel_ball")
                .resizable()
                .frame(width: 210, height: 210)
                .rotationEffect(.degrees(wheelComplicatedViewModel.ballAngle))
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    if #available(iOS 17.0, *) {
                        withAnimation(.easeOut(duration: wheelComplicatedViewModel.timeRemaining)) {
                            wheelComplicatedViewModel.wheelAngle = Double.random(in: 900.0...3000.0)
                            wheelComplicatedViewModel.ballAngle = -Double.random(in: 900.0...3000.0)
                        } completion: {
                            let wheelResultAngle = wheelComplicatedViewModel.calculateAngle(wheelComplicatedViewModel.wheelAngle)
                            let ballResultAngle = wheelComplicatedViewModel.calculateAngle(wheelComplicatedViewModel.ballAngle, isBall: true)
                            if wheelResultAngle < ballResultAngle {
                                let result = wheelComplicatedViewModel.getRWC(result: wheelResultAngle + (360.0 - ballResultAngle))
                                wheelComplicatedViewModel.resultGameRWCData = result
                                let amountResult = wheelComplicatedViewModel.calculateGameResult(
                                    amount: wheelComplicatedViewModel.amount,
                                    selectType: wheelComplicatedViewModel.selectType,
                                    result: result,
                                    colorSelect: wheelComplicatedViewModel.colorSelect,
                                    numSelect: wheelComplicatedViewModel.numSelect
                                )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    wheelComplicatedViewModel.setResultScene(amountResult)
                                })
                                
                            } else {
                                let result = wheelComplicatedViewModel.getRWC(result: wheelResultAngle - ballResultAngle)
                                wheelComplicatedViewModel.resultGameRWCData = result
                                let amountResult = wheelComplicatedViewModel.calculateGameResult(
                                    amount: wheelComplicatedViewModel.amount,
                                    selectType: wheelComplicatedViewModel.selectType,
                                    result: result,
                                    colorSelect: wheelComplicatedViewModel.colorSelect,
                                    numSelect: wheelComplicatedViewModel.numSelect
                                )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    wheelComplicatedViewModel.setResultScene(amountResult)
                                })
                            }
                        }
                    } else {
                        withAnimation(.easeOut(duration: wheelComplicatedViewModel.timeRemaining)) {
                            wheelComplicatedViewModel.wheelAngle = Double.random(in: 900.0...3000.0)
                            wheelComplicatedViewModel.ballAngle = -Double.random(in: 900.0...3000.0)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + wheelComplicatedViewModel.timeRemaining) {
                            let wheelResultAngle = wheelComplicatedViewModel.calculateAngle(wheelComplicatedViewModel.wheelAngle)
                            let ballResultAngle = wheelComplicatedViewModel.calculateAngle(wheelComplicatedViewModel.ballAngle, isBall: true)
                            if wheelResultAngle < ballResultAngle {
                                let result = wheelComplicatedViewModel.getRWC(result: wheelResultAngle + (360.0 - ballResultAngle))
                                wheelComplicatedViewModel.resultGameRWCData = result
                                let amountResult = wheelComplicatedViewModel.calculateGameResult(
                                    amount: wheelComplicatedViewModel.amount,
                                    selectType: wheelComplicatedViewModel.selectType,
                                    result: result,
                                    colorSelect: wheelComplicatedViewModel.colorSelect,
                                    numSelect: wheelComplicatedViewModel.numSelect
                                )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    wheelComplicatedViewModel.setResultScene(amountResult)
                                })
                                
                            } else {
                                let result = wheelComplicatedViewModel.getRWC(result: wheelResultAngle - ballResultAngle)
                                wheelComplicatedViewModel.resultGameRWCData = result
                                let amountResult = wheelComplicatedViewModel.calculateGameResult(
                                    amount: wheelComplicatedViewModel.amount,
                                    selectType: wheelComplicatedViewModel.selectType,
                                    result: result,
                                    colorSelect: wheelComplicatedViewModel.colorSelect,
                                    numSelect: wheelComplicatedViewModel.numSelect
                                )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    wheelComplicatedViewModel.setResultScene(amountResult)
                                })
                            }
                        }
                    }
                })

            }
    }
}
