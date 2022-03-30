//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("tangerine"), Color("bloodOrange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ChoiceButtons(message: "5")
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
