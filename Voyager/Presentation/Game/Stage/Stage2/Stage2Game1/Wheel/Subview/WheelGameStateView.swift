//
//  WheelGameStateView.swift
//  Voyager
//
//  Created by admin on 12.12.2023.
//

import SwiftUI

struct WheelGameStateView: View {
    @EnvironmentObject var wheelViewModel: WheelViewModel
    @State private var isGame = false
    @State var gameResult = ""
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
                    isGame = true
                    if #available(iOS 17.0, *) {
                        withAnimation(.easeOut(duration: wheelViewModel.timeRemaining)) {
                            wheelViewModel.angle = Double.random(in: 900.0...3000.0)
                        }
                    completion: {
                        let finishAngle = wheelViewModel.angle / 360.0
                        let remains = finishAngle.truncatingRemainder(dividingBy: 1.0)
                        let resultAngle = remains * 360.0
                        let result = wheelViewModel.getRW(result: resultAngle)
                        gameResult = "\(result.num) \(result.color)"
                        print(result)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                            wheelViewModel.setResultScene()
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
                            gameResult = "\(result.num) \(result.color)"
                            print(result)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                                wheelViewModel.setResultScene()
                            })
                        }
                    }
                })
         
            }
    }
}
