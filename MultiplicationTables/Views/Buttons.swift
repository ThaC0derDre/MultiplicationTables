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
            // functions goes here
        }
        .font(.title.bold())
        .padding(30)
        .frame(width: 300, height: 75)
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ProgressButtons_Preview: PreviewProvider {
    static var previews: some View {
        ProgressButtons(message: "NEXT ->", color: .green)
    }
}
