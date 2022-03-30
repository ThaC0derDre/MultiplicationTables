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

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        Labels(titleLabel: "How many questions?")
    }
}
