//
//  TextSpeedView.swift
//  Voyager
//
//  Created by admin on 12/14/23.
//
//MARK: - Upd

import Foundation
import SwiftUI

struct TextSpeedView: View {
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    
    var body: some View {
        ZStack {
            Image("backPreview")
                .resizable()
                .ignoresSafeArea(.all)
            
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
                .padding()
                
                Spacer()
                
                Text("Здесь вы можете отрегулировать скорость текста так, что бы вам было комфортно играть")
                    .frame(height: 120)
                    .font(.system(size: 24))
                    .padding(12)
                    .foregroundStyle(.white)
                    .font(.system(size: 18).monospaced().weight(.bold))
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .background(.nextButton)
                    .border(Color.black, width: 5)
                
                HStack {
                    Button(action: {
                        StorageManager.shared.textSpeedDown()
                        print(StorageManager.shared.textSpeed)
                    }, label: {
                        Image("down")
                    })
                    
                    Text("\(StorageManager.shared.textSpeed)")
                        .frame(height: 50)
                        .font(.system(size: 24))
                        .padding(12)
                        .foregroundStyle(.white)
                        .font(.system(size: 18).monospaced().weight(.bold))
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(.nextButton)
                        .border(Color.black, width: 5)
                    
                    Button(action: {
                        StorageManager.shared.textSpeedUp()
                        print(StorageManager.shared.textSpeed)
                    }, label: {
                        Image("up")
                    })
                    
                    
                }
                
                Spacer()
                
            }
        }
    }
}

//#Preview {
//    TextSpeedView()
//}

