//
//  QuizView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 4/8/22.
//

import SwiftUI
import Progress_Bar

struct QuizView: View {
    @State var timesTable: Int
    @State var qAmount: Int
    @State var quiz: [Quiz]
    @State private var questionNumber       = 0
    @State private var score                = 0
    @State private var flashRed             = false
    @State private var showEndScreen        = false
    @State private var percentage: CGFloat  = 0.0
    var body: some View {
        VStack{
            Spacer()
            Text(quiz[questionNumber].question)
                .font(.largeTitle.bold())
                .padding(.bottom, 90)
            
            //MARK: - Buttons

            
            VStack{
            ForEach(0..<3) { number in
                let choice = choiceGen(with: quiz[questionNumber].choices, for: number)
                Button("\(choice)"){
                    checkAnswer(userAnswer: choice)
                }
                .font(.title.bold())
                .frame(width: 200, height: 75)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
            }
            }
            .padding(.top, 8)
            .navigationBarBackButtonHidden(true)
            NavigationLink(isActive: $showEndScreen) {
                EndScreenView(score: score, questionAmount: questionNumber, quiz: quiz, timesTable: timesTable, qAmount: qAmount)
            } label: {
                EmptyView()
            }
            
// progressbar
            Spacer()
                .frame(height: 70)
            VStack{
            LinearProgress(percentage: 0.5, backgroundColor: .orange, foregroundColor: LinearGradient(gradient: Gradient(colors: [.blue, .blue]), startPoint: .leading, endPoint: .trailing))
                    .ignoresSafeArea()
                .frame(height: 30, alignment: .bottom)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.bottom, 35)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(flashRed ? .red : .white).ignoresSafeArea()
        .preferredColorScheme(.light)
    }
    
    // somehow grab choices into array, shuffled. When called, grab specific
    func choiceGen(with allChoices: Choices, for buttonNumber: Int) -> Int {
        let choices = [allChoices.choice1, allChoices.choice2, allChoices.choice3]
        let aChoice = choices[buttonNumber]
        return aChoice
    }
    
    // Check if answer is correct
    func checkAnswer(userAnswer: Int){
        if userAnswer == quiz[questionNumber].choices.correctAnswer{
            score += 1
            if qAmount != (questionNumber + 1){
                questionNumber += 1
            }else{
                showEndScreen.toggle()
            }
        }else{
            withAnimation {
                flashRed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                withAnimation {
                    flashRed = false
                }
                if qAmount != (questionNumber + 1){
                    questionNumber += 1
                }else{
                    showEndScreen.toggle()
                }
            }
        }
    }
}



struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(timesTable: 3, qAmount: 3, quiz: [Quiz(question: "What is 2x2?", choices: Choices(choice1: 1, choice2: 2, choice3: 3, correctAnswer: 3))])
    }
}
