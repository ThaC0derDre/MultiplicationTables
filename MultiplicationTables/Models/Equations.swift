//
//  Equations.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/30/22.
//

import Foundation
import SwiftUI

struct Equations {
    var correctAnswers           = Array<Int>()
    var equations                = Array<String>()
    var multipleChoice           = Array<[Int]>()
    
}

final class EquationModel: ObservableObject {
    
    @Published var settingsData: SettingsData   = .init()
    @Published var eq: Equations                = .init()
    @State private var numsToTwelve             = Array(0...12)
    
    
    func generateEquations(qAmount: Int, stepperAmount: Int ){
        print("func triggered, stepper amount: \(stepperAmount)")
        for _ in 0..<qAmount {
            if let randNumb    = numsToTwelve.randomElement(){
                let anEquation = ("\(randNumb) x \(stepperAmount) = ?")
                let correctAnswer = randNumb * stepperAmount
                eq.correctAnswers.append(correctAnswer)
                eq.multipleChoice.append(choices(correct: correctAnswer))
                eq.equations.append(String(anEquation))
            }
            print("\(eq.equations)")
        }
        print("generatedEquations with eqs being: \(eq.equations)")
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
    
    func newQuiz(qAmount: Int, stepperAmount: Int){
        eq.equations = []
        generateEquations(qAmount: qAmount, stepperAmount: stepperAmount)
        print("new quiz")
    }
    
    func choices(correct: Int) -> Array<Int> {
        var choices = Array<Int>()
        if correct > 2{
            for i in 1..<correct {
                choices.append(correct - i)
            }
            for i in (correct + 1)...62 {
                choices.append(i)
            }
        }else{
            for i in (correct + 1)...50 {
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
