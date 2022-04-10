//
//  EndScreenView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 4/9/22.
//

import SwiftUI

struct EndScreenView: View {
    var score: Int
    var questionAmount: Int
    var quiz: [Quiz]
    @State var timesTable: Int
    @State var qAmount: Int
    @State private var redoQuiz = false
    @State private var newQuiz  = false
    
    var body: some View {
        VStack{
            // Message to change depending on
            Text("Well done!")
            Text("Your score: \(score) out of \(questionAmount + 1)")
            Button("Retry"){
                redoQuiz.toggle()
            }
            Button("New Quiz"){
                newQuiz.toggle()
            }
            
            NavigationLink("", isActive: $redoQuiz){
                QuizView(timesTable: timesTable, qAmount: qAmount, quiz: quiz)
            }
            
            NavigationLink("", isActive: $newQuiz){
                ContentView()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}

struct EndScreenView_Previews: PreviewProvider {
    static var previews: some View {
        EndScreenView(score: 3, questionAmount: 5, quiz: [Quiz(question: "3x3?", choices: Choices(choice1: 3, choice2: 4, choice3: 5, correctAnswer: 4))], timesTable: 3, qAmount: 3)
    }
}
