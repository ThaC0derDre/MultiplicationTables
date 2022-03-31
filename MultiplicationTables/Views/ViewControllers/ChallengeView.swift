//
//  ChallengeView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/29/22.
//

import SwiftUI

struct ChallengeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                GameQuestionLabel()
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
        ChallengeView()
    }
}
