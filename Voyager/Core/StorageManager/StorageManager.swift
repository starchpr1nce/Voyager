//
//  StorageManager.swift
//  Voyager
//
//  Created by admin on 23.11.2023.
//
//MARK: - Upd

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    //MARK: - onboarding
    
    @AppStorage(SMKeys.ONBOARDING_PRESENTED) private(set) var onboardingPresented = false
    
    @AppStorage(SMKeys.GAME_TEXT_SIZE) private(set) var textSize = 14
    
    func textSizeDown() {
        textSize -= 1
    }
    
    func textSizeUp() {
        textSize += 1
    }
    
    @AppStorage(SMKeys.GAME_TEXT_SPEED) private(set) var textSpeed  = 1_000_000
    func textSpeedDown() {
        textSpeed -= 200_000
    }
    func textSpeedUp() {
        textSpeed += 200_000
    }
    
    func toggleOnboarding() {
        onboardingPresented.toggle()
    }
    
    //MARK: - stage state
    
    @AppStorage(SMKeys.STAGE_1_STATE) private(set) var stage1State = GameStageState.preview
    @AppStorage(SMKeys.STAGE_2_STATE) private(set) var stage2State = GameStageState.preview
    @AppStorage(SMKeys.STAGE_3_STATE) private(set) var stage3State = GameStageState.preview
    @AppStorage(SMKeys.STAGE_4_STATE) private(set) var stage4State = GameStageState.preview
    @AppStorage(SMKeys.STAGE_5_STATE) private(set) var stage5State = GameStageState.preview
    
    func setStage1State(_ state: GameStageState) {
        stage1State = state
    }
    
    func setStage2State(_ state: GameStageState) {
        stage2State = state
    }
    
    func setStage3State(_ state: GameStageState) {
        stage3State = state
    }
    
    func setStage4State(_ state: GameStageState) {
        stage4State = state
    }
    
    func setStage5State(_ state: GameStageState) {
        stage5State = state
    }
    
    //MARK: - current stage
    
    @AppStorage(SMKeys.CURRENT_STAGE) private(set) var currentStageState = CurrentStageState.stage1
    
    func setCurrentStage(_ stage: CurrentStageState) {
        currentStageState = stage
    }
    
//    //MARK: - karma
//    
//    @AppStorage(SMKeys.GAME_KARMA) private(set) var gameKarma = 50
//    
//    func increaseKarma(_ value: Int) {
//        if gameKarma < 100 {
//            gameKarma += value
//        }
//    }
//    
//    func reduceKarma(_ value: Int) {
//        if gameKarma > 0 {
//            gameKarma -= value
//        }
//    }
    
    //MARK: - karma
    
    @AppStorage(SMKeys.GAME_KARMA) private(set) var gameKarma = 50
    
    func increaseKarma() {
        if gameKarma < 100 {
            gameKarma += 5
        }
    }
    
    func reduceKarma() {
        if gameKarma > 0 {
            gameKarma -= 5
        }
    }
    
    //MARK: - health
    
    @AppStorage(SMKeys.GAME_HEALTH) private(set) var gameHealth = 50
    
    func increaseHealth(_ value: Int) {
        if gameHealth < 100 {
            gameHealth += value
        }
    }
    
    func reduceHealth(_ value: Int) {
        if gameHealth > 0 {
            gameHealth -= value
        }
    }
    
    //MARK: - cash
    
    @AppStorage(SMKeys.GAME_CASH) private(set) var gameCash = 50
    
    func increaseCash(_ value: Int) {
        gameCash += value
    }
    
    func reduceCash(_ value: Int) {
        if gameCash > 0 {
            gameCash -= value
        }
    }
}

