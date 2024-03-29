//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/27/22.
//

import SwiftUI

struct ContentView: View {
    //Stepper Properties
    @State private var hideMinus        = false
    @State private var timesTable       = 3
    @State private var hidePlus         = false
    
    // Question Button Props
    @State private var isSelected       = 5
    private let qAmounts                = [5, 10, 15]
    
    @State private var showQuiz         = false
    @State var quiz = [Quiz]()
    var body: some View {
        
        
        // Menu Setup
        VStack{
            //MARK: - TimesTable Stepper
            
            
            Text("Choose Times Table")
                .font(.largeTitle.bold())
                .padding(.bottom)
                .padding(.top, 50)
            HStack{
                // Cute Stepper
                Button{
                    if timesTable == 2 {return}
                    hidePlus    = false
                    hideMinus   = false
                    timesTable -= 1
                    if timesTable == 2 {
                        hideMinus = true
                    }
                    
                } label: {
                    ZStack{
                        Image(systemName: "arrowtriangle.left.fill")
                            .resizable()
                            .frame(width: 63, height: 60)
                        
                            .foregroundColor(hideMinus ? Color(k.main) : Color(k.secondary))
                            .padding(.horizontal, 7)
                        
                        Text("  -")
                            .font(.title)
                            .foregroundColor(hideMinus ? Color(k.main) : .black)
                    }
                }
                // selected number
                Text("\(timesTable)")
                    .font(.largeTitle.bold())
                    .padding()
                
                Button{
                    if timesTable == 12 {return}
                    
                    hidePlus    = false
                    hideMinus   = false
                    timesTable += 1
                    if timesTable == 12 {
                        hidePlus = true
                    }
                } label: {
                    ZStack{
                        Image(systemName: "arrowtriangle.right.fill")
                            .resizable()
                            .frame(width: 63, height: 60)
                            .foregroundColor(hidePlus ? Color(k.main) : Color(k.secondary))
                            .padding(.horizontal, 7)
                        
                        HStack{
                            // Right Button. Hstack to center +
                        Text("  +    ")
                            .font(.title)
                            .foregroundColor(hidePlus ? Color(k.main) : .black)
                            Text("   ")
                                .font(.title)
                                .foregroundColor(hidePlus ? Color(k.main) : .black)
                        }
                    }
                }
                
            }
            
            //MARK: - Example
            
            Text("Ex. \(timesTable) X 1")
                .font(.caption)
                .foregroundColor(.secondary)
            Text("Ex. \(timesTable) X 4")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom)
            Spacer()
            //MARK: - Question Amount
            
            // How Many Questions?
            Text("How Many Questions?")
                .font(.largeTitle.bold())
            
            HStack{
                ForEach(qAmounts, id: \.self){ number in
                    Button("\(number)"){
                        withAnimation{
                            isSelected = number
                        }
                    }
                    
                    .font(.title.bold())
                    .frame(width: 70, height: 70)
                    .background(Color(k.secondary))
                    .opacity(isSelected == number ? 1.0 : 0.35)
                    .foregroundColor(.black)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 7)
//                            .stroke(.white, lineWidth: 3)
//                    )
                    .padding(.horizontal, 10)
                }
            }
            
            
            
            Spacer()
            Button("LETS GO! 💪🏼"){
                generateQuestions(questionsAmount: isSelected, timesTable: timesTable)
                showQuiz.toggle()
            }
            .font(.title)
            .frame(width: 200, height: 65)
            .background(Color(k.secondary))
            .foregroundColor(Color(.black))
            .clipShape(Capsule())
            .padding(.bottom, 40)
            
            NavigationLink("", isActive: $showQuiz){
                QuizView(timesTable: timesTable, qAmount: isSelected, quiz: quiz)
            }
            .navigationTitle("Multiply!")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.light)
            .navigationBarBackButtonHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(k.main))
    }
    
    // Enter amount of Questions asked for, and TimesTable
    func generateQuestions(questionsAmount: Int, timesTable: Int){
        var aBunchOfNumbs = [1,2,3,4,5,6,7,8,9,10,11,12]
        aBunchOfNumbs.shuffle()
        
        var someNumb = [Int]()
        // generate random numbers to multiply against given timesTable
        for i in 1...questionsAmount{
            if i < 12 {
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
