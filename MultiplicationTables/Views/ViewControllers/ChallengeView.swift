//
//  ChallengeView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/29/22.
//

import SwiftUI

struct ChallengeView: View {
    @State private var questionArray = ["2 x 2"]
    
    var body: some View {
        VStack{
            GameQuestionLabel(problemToSolve: questionArray)
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
