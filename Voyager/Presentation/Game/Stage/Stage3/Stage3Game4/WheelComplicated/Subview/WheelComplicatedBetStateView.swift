//
//  WheelComplicatedBetStateView.swift
//  Voyager
//
//  Created by admin on 13.12.2023.
//

import SwiftUI

struct WheelComplicatedBetStateView: View {
    @EnvironmentObject var wheelViewModel: WheelComplicatedViewModel
    var body: some View {
        VStack {
            Text("Поставить")
                .gameButtonStyle(.textBack)
            VStack {
                ForEach([100, 250, 500], id: \.self) { amount in
                    Button(action: {
                        wheelViewModel.amount = amount
                        wheelViewModel.setSetupTypeState()
                    }, label: {
                        Text("\(amount)")
                            .gameButtonStyle(.nextButton)
                    })
                    
                }
            }
            
            .padding(.bottom, 32)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .miniGameBackground()
        
        
    }
}
