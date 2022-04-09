//
//  Quiz.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 4/7/22.
//

import Foundation
import SwiftUI

struct Quiz {
    let question: String
    var choices: Choices
}

struct Choices {
    let choice1: Int
    let choice2: Int
    let choice3: Int
    let correctAnswer: Int
}
