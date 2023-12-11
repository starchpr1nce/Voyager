//
//  MiniGameBackground.swift
//  Voyager
//
//  Created by mnats on 11.12.2023.
//

import SwiftUI

struct MiniGameBackground: ViewModifier {
    var height: CGFloat
    func body(content: Content) -> some View {
        content
            .background {
                ZStack {
                    VStack(spacing: 0) {
                        Spacer()
                        Rectangle()
                            .fill(.black)
                            .frame(height: 5)
                        Rectangle()
                            .foregroundStyle(Color(red: 0.13, green: 0.14, blue: 0.19))
                            .frame(height: UIScreen.main.bounds.height * height)
                    }
                }
                .ignoresSafeArea()
            }
    }
}
