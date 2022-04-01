//
//  ChallengeView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/29/22.
//

import SwiftUI

struct ChallengeView: View {
    @ObservedObject var eqm: EquationModel
    @State var questionNumber       = 0
    
    var body: some View {
        NavigationView{
            LazyVStack{
                GameQuestionLabel(eqm: eqm, questionNumber: questionNumber)
                ChoiceButtons(message: "2")
                ChoiceButtons(message: "3")
                ChoiceButtons(message: "4")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(eqm: .init())
    }
}
