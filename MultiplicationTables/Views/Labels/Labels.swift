//
//  Labels.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/28/22.
//

import SwiftUI

struct Labels: View {
    @State var titleLabel: String
    var body: some View {
        Text(titleLabel)
            .font(.largeTitle)
            .foregroundColor(Color("darkerGreen"))
    }
}

struct GameQuestionLabel: View {
    @ObservedObject var eqm: EquationModel
    @State var questionNumber: Int
    
    var body: some View {
        LazyVStack{
            
            Text("What is")
                .multilineTextAlignment(.center)
                
            Text("\(eqm.eq.equations[questionNumber])")
                .font(.largeTitle.weight(.heavy))
                .multilineTextAlignment(.center)
            //Change font family
        
        }
        .font(.largeTitle)
            .frame(width: 300, height: 150, alignment: .center)
    }
}


struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
//        Labels(titleLabel: "How many questions?")
            
            GameQuestionLabel(eqm: .init(), questionNumber: 0)
        }
    }
}
