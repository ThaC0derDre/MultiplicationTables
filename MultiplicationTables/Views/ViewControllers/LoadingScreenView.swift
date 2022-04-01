//
//  LoadingScreenView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/31/22.
//

import SwiftUI

struct LoadingScreenView: View {
    @State private var showQuiz    = false
    @ObservedObject var eqm: EquationModel
    
    var body: some View {
        VStack{
            Text("Practice makes perfect!\n Do your best!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("😎")
                .font(.system(size: 75))
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(2)) {
                showQuiz    = true
            }
        }
        NavigationLink(destination:
                        ChallengeView(eqm: eqm),
                       isActive: self.$showQuiz) {
            EmptyView()
        }.hidden()
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView(eqm: .init())
    }
}
