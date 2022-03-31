//
//  DataModel.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/30/22.
//

import Foundation

final class SettingsData: ObservableObject {
    
    
    @Published var questionAmount   = 5
    @Published var stepperAmount    = 3
    @Published var userChoice       = 3
    @Published var userReady        = false
}
