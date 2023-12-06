//
//  GameButtonModifier.swift
//  Voyager
//
//  Created by admin on 06.12.2023.
//

import SwiftUI

struct GameButtonModifier: ViewModifier {
    var backgroundColor: Color
    var width: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(12)
            .foregroundStyle(.white)
            .font(.system(size: 18).monospaced().weight(.bold))
            .frame(width: width)
            .background(backgroundColor)
            .border(Color.black, width: 2)
    }
}
