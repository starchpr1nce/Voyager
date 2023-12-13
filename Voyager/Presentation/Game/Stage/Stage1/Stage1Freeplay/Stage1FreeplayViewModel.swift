//
//  Stage1FreeplayViewModel.swift
//  Voyager
//
//  Created by admin on 13.12.2023.
//

import Combine

final class Stage1FreeplayViewModel: ObservableObject {
    
    @Published var state: Stage1FreeplayState = .main
    
    enum Stage1FreeplayState {
        case main, game1, game2, game3, game4
    }
}
