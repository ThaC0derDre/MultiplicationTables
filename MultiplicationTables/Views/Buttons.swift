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

struct StepperButtons: View {
    @State var stepDown: Int
    @State var selectedNum: Int
    @State var stepUp: Int
    @State private var hideButtonOne    = false
    @State private var hideButtonTwo    = false
    
    var body: some View {
        HStack(spacing: 30) {
            
            Button(hideButtonOne ? " " : "\(stepDown)"){
                guard !hideButtonOne else { return }
                applyStepper(with: -1)
                }
            
                Text("\(selectedNum)")
                    .font(.largeTitle)
            Button(hideButtonTwo ? "    " : "\(stepUp)"){
                guard !hideButtonTwo else { return }
                applyStepper(with: 1)
            }
            
        }
        .font(.title)
        .padding(30)
        
    }
    
    
    
    func applyStepper(with number: Int){
        stepUp += number
        selectedNum += number
        stepDown += number
        
        if selectedNum == 2 {
            hideButtonOne = true
        }else if selectedNum == 11{
            hideButtonTwo = true
        }else{
            hideButtonOne = false
            hideButtonTwo = false
        }
    }
}

struct Buttons_Preview: PreviewProvider {
    static var previews: some View {
        //        ProgressButtons(message: "NEXT ->", color: .green)
        VStack(spacing: 30){
            StepperButtons(stepDown: 4, selectedNum: 5, stepUp: 6)
            ChoiceButtons(message: "4")
            ChoiceButtons(message: "6")
            ChoiceButtons(message: "19")
        }
    }
}
