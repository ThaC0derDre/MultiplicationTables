//
//  DataModel.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/30/22.
//

import Foundation

struct SettingsData {
    
     var questionAmount   = 5
     var stepperAmount    = 3 {
        didSet{
            print("StepperAmount = \(stepperAmount)")
        }
    }
     var userChoice       = 3
     var userReady        = false
}
