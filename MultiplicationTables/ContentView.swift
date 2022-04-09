//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var timesTable       = 2
    @State private var questionAmount   = 5
    @State private var showQuiz         = false
    @State var quiz = [Quiz]()
    private let qArray = [5, 10, 15]
    var body: some View {
        
        NavigationView{
            // Menu Setup
            VStack{
                Text(timesTable == 7 ? "Ex. \(timesTable) X 4": "Ex. \(timesTable) X 7")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack{
                    Text("Select Times-Table")
                        .padding(.horizontal)
                    Spacer()
                    
                    Picker("TimesTable", selection: $timesTable) {
                        ForEach(2..<13, id: \.self){ number in
                            Text("x\(number)")
                        }
                    }
                    .padding(.horizontal)
                }
                
                // How Many Questions?
                HStack{
                    Text("How many questions?")
                        .padding(.horizontal)
                    Spacer()
                    
                    Picker("Question Amount", selection: $questionAmount) {
                        ForEach(qArray, id:\.self) {
                            Text("\($0)")
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                Button("Let's Go! 💪🏼"){
                    generateQuestions(questionsAmount: questionAmount, timesTable: timesTable)
                    showQuiz.toggle()
                }
                .frame(width: 200, height: 50)
                .background(.blue)
                .foregroundColor(Color(.white))
                .clipShape(Capsule())
                .padding(.bottom, 40)
                
                NavigationLink("", isActive: $showQuiz){
                    QuizView(timesTable: timesTable, qAmount: questionAmount, quiz: quiz)
                }
                
            }
        }
    }
    // Enter amount of Questions asked for, and TimesTable
    func generateQuestions(questionsAmount: Int, timesTable: Int){
        var aBunchOfNumbs = [1,2,3,4,5,6,7,8,9,10,11,12]
        aBunchOfNumbs.shuffle()
        print(aBunchOfNumbs)
        
        var someNumb = [Int]()
        // generate random numbers to multiply against given timesTable
        for i in 1...questionsAmount{
            if i < 13 {
                someNumb.append(aBunchOfNumbs[i])
            }else {
                // if more than 12, grab more random numbers until attain question amount.
                aBunchOfNumbs.shuffle()
                someNumb.append(aBunchOfNumbs[i - 10])
            }
        }
        
        // Set up questions with answers and choices.
        for j in 0..<questionsAmount {
            let correctAnswer = timesTable * someNumb[j]
            var jumbledAnswers = [correctAnswer, correctAnswer - 1, correctAnswer + 2]
            jumbledAnswers.shuffle()
            let choices = Choices(choice1: jumbledAnswers[0], choice2: jumbledAnswers[1], choice3: jumbledAnswers[2], correctAnswer: correctAnswer)
            
            
            let aQuiz = Quiz(question: "\(someNumb[j]) X \(timesTable)", choices: choices)
            quiz.append(aQuiz)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
