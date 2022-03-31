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
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
