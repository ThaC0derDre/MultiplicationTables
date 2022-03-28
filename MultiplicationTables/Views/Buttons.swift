//
//  Buttons.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/27/22.
//

import SwiftUI

struct ProgressButtons: View {
    var message: String
    var color: Color
    var body: some View {
        Button(message) {
            // functions goes here?
        }
        .font(.title.bold())
        .padding(30)
        .frame(width: 300, height: 75)
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ChoiceButtons: View {
    var message: String
    var body: some View {
        Button(message){
            // return text?
        }
        .font(.title.bold())
        .padding(30)
        .frame(width: 150, height: 75)
        .background(.yellow)
    }
}


struct Buttons_Preview: PreviewProvider {
    static var previews: some View {
//        ProgressButtons(message: "NEXT ->", color: .green)
        VStack(spacing: 30){
            ChoiceButtons(message: "4")
            ChoiceButtons(message: "6")
            ChoiceButtons(message: "19")
        }
    }
}
