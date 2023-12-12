//
//  ViewExtension.swift
//  Voyager
//
//  Created by admin on 06.12.2023.
//

import SwiftUI

extension View {
    func gameButtonStyle(_ backgroundColor: Color, width: CGFloat = UIScreen.main.bounds.width * 0.9) -> some View {
        self.modifier(GameButtonModifier(backgroundColor: backgroundColor, width: width))
    }
    
    func miniGameBackground(height: CGFloat? = nil) -> some View {
        self.modifier(MiniGameBackground(height: height ?? 0.4))
    }
    
    func gameTextStyle(_ backgroundColor: Color, width: CGFloat = UIScreen.main.bounds.width * 0.9) -> some View {
        self.modifier(GameTextModifier(backgroundColor: backgroundColor, width: width))
    }
}
