//
//  Questions.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/30/22.
//

import Foundation
import SwiftUI

enum GameQuestions {
    case twos
    case threes
    case fours
    case fives
    case sixes
    case cevens
    case eights
    case nines
    case tens
    case elevens
    case twelves
    case all
}

struct TimesTables {
    var numsToTwelve  = Array(0...12)
    var questionAmount: Int
    var timesTable: Int
    var equations = Array<String>()
    
    mutating func generateEquation(numbOfQs qs: Int, table num: Int){
        for _ in 0..<qs {
            let anEquation = ("\(numsToTwelve.randomElement()!) x \(num) = ?")
            equations.append(String(anEquation))
        }
    }
    
    func checkAnswer(usersAnswer: Int) -> Bool {
        let correctAnswer = questionAmount * timesTable
        if usersAnswer == correctAnswer {
            return true
        }else {
            return false
    }
    //later do "if checkAnswer{  score += 1, newQuestion()"
    
}

/* something like..
 questionAmount = 5 questions
 timesTable = 3's
 numbers = 1...12
 quiz  = timesTable(table: 3, q: 5)
 
 timesTabel = ("\(timesTable) x \(numbers)")
 
 func checkAnswer(userChoice){
 answer = timesTable * table
 if userChoice == answer...
 }
 
 
 */
