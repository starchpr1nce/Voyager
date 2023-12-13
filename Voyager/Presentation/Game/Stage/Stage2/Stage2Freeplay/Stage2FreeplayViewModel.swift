//
//  Stage2FreeplayViewModel.swift
//  Voyager
//
//  Created by admin on 12/1/23.
//

import Combine

final class Stage2FreePlayViewModel: ObservableObject {
    
    @Published var state: Stage2FreeplayState = .main
    
    enum Stage2FreeplayState {
        case main, game1, game2, game3, game4
    }
}

