//
//  CardView.swift
//  dices
//
//  Created by mnats on 21.11.2023.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card = Card(.six, of: .spades)
    
    var rankLabel: String {
        switch card.rank {
        case .six:
            "6"
        case .seven:
            "7"
        case .eight:
            "8"
        case .nine:
            "9"
        case .ten:
            "10"
        case .jack:
            "J"
        case .queen:
            "Q"
        case .king:
            "K"
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if !card.isClosed {
                Image(card.suit.rawValue)
                    .resizable()
                    .frame(width: 50, height: 75)
                Text(rankLabel)
                    .font(.title3.bold())
                    .foregroundStyle(card.suit == .clubs || card.suit == .spades ? .black : .red)
                    .padding(5)
            } else {
                Image("cardBack")
                    .resizable()
                    .frame(width: 50, height: 75)
            }
        }
        .transition(.scale(scale: 1))
        .rotation3DEffect(.degrees(card.isClosed ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

#Preview {
    VStack {
        let card = Card(.eight, of: .clubs)
        CardView(card: card)
        Button("Turn") {
            withAnimation {
                card.isClosed.toggle()
            }
        }
    }
}
