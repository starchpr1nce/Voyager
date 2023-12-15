//
//  OnboardingViewModel.swift
//  Voyager
//
//  Created by admin on 20.11.2023.
//
//MARK: - Upd

import Combine

final class OnboardingViewModel: ObservableObject {
    
    @Published private(set) var _onbStatus: OnbStatus = .scene0
    
    func setScene0() {
        _onbStatus = .scene0
    }
    
    func setScene1() {
        _onbStatus = .scene1
    }
    
    func setScene2() {
        _onbStatus = .scene2
    }
    
    func setScene3() {
        _onbStatus = .scene3
    }
    
    
    
    enum OnbStatus {
        case scene0, scene1, scene2, scene3
    }
    
}
