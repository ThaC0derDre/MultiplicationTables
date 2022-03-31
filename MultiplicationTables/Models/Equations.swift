//
//  Equations.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/30/22.
//

import Foundation
import SwiftUI

struct Equations {
    
    @StateObject private var settingsData   = SettingsData()
    @State private var numsToTwelve         = Array(0...12)
    @State var correctAnswers               = Array<Int>()
    @State var equations                    = Array<String>()
    @State var multipleChoice               = Array<[Int]>()
    
    
    
    mutating func generateEquations(){
        for _ in 0..<settingsData.questionAmount {
            if let randNumb    = numsToTwelve.randomElement(){
                let anEquation = ("\(randNumb) x \(settingsData.stepperAmount) = ?")
                let correctAnswer = randNumb * settingsData.stepperAmount
                correctAnswers.append(correctAnswer)
                multipleChoice.append(choices(correct: correctAnswer))
                equations.append(String(anEquation))
            }
        }
    }
    
    func checkAnswer(usersAnswer: Int) -> Bool {
        let correctAnswer = settingsData.questionAmount * settingsData.stepperAmount
        if usersAnswer == correctAnswer {
            return true
        }else {
            return false
        }
        //later do "if checkAnswer{  score += 1, newQuestion()"
        
    }
    
    mutating func newQuiz(){
        equations = []
        generateEquations()
    }
    
    func choices(correct: Int) -> Array<Int> {
        var choices = Array<Int>()
        if correct > 2{
            for i in 1..<correct {
                choices.append(correct - i)
            }
            for i in (correct + 1)...24 {
                choices.append(i)
            }
        }else{
            for i in (correct + 1)...24 {
                choices.append(i)
            }
        }
        choices.shuffle()
        let newChoice = [choices[0], choices[1], correct]
        return newChoice.shuffled()
    }
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
