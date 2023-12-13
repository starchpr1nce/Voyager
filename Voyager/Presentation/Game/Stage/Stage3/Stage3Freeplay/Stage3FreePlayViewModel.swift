//
//  Stage3FreePlayViewModel.swift
//  Voyager
//
//  Created by admin on 13.12.2023.
//

import Combine

final class Stage3FreePlayViewModel: ObservableObject {
    
    @Published var state: Stage3FreeplayState = .main
    
    enum Stage3FreeplayState {
        case main, game1, game2, game3, game4
    }
}
