//
//  QuizView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 4/8/22.
//

import SwiftUI

struct QuizView: View {
    @State var timesTable: Int
    @State var qAmount: Int
    @State var quiz: [Quiz]
    @State private var questionNumber = 0
    var body: some View {
        
        Text(quiz[questionNumber].question)
            .font(.largeTitle.bold())
        
        
        ForEach(0..<3) { number in
            Button("\(choiceGen(with: quiz[questionNumber].choices, for: number))"){
                questionNumber += 1
            }
            .font(.title.bold())
            .frame(width: 200, height: 75)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding()
        }
        
        
        
        .navigationTitle("\(timesTable)'s!")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        
    }
        
    
    // somehow grab choices into array, shuffled. When called, grab specific
    func choiceGen(with allChoices: Choices, for buttonNumber: Int) -> Int {
        let choices = [allChoices.choice1, allChoices.choice2, allChoices.choice3]
        let aChoice = choices[buttonNumber]
        return aChoice
    }
}


    
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(timesTable: 3, qAmount: 3, quiz: [Quiz(question: "What is 2x2?", choices: Choices(choice1: 1, choice2: 2, choice3: 3, correctAnswer: 3))])
    }
}
