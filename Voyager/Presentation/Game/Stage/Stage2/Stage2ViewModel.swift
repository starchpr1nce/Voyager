//
//  Stage1ViewModel.swift
//  Voyager
//
//  Created by admin on 27.11.2023.
//

import Combine
import Foundation

final class Stage2ViewModel: ObservableObject {
    
    let appController: ApplicationController
    
    init(appController: ApplicationController) {
        self.appController = appController
    }
    
    @Published var stageState = StorageManager.shared.stage2State
    @Published var background = ""
    @Published var character = ""
    
    func setState(_ state: GameStageState) {
        DispatchQueue.main.async {
            StorageManager.shared.setStage2State(state)
            self.stageState = StorageManager.shared.stage2State
        }
        
    }
    
    func setBackImages(background: String, character: String) {
        self.background = background
        self.character = character
    }
}
