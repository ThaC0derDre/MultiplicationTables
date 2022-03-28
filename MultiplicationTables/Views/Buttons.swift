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
    @State private var stepDown     = 2
    @State private var selectedNum  = 3
    @State private var stepUp       = 4
    @State private var hideButtonOne    = false
    @State private var hideButtonTwo    = false
    
    var body: some View {
        HStack(spacing: 30) {
            ZStack{
                if !hideButtonOne {
                Image(systemName: "arrowtriangle.left.fill")
                    .resizable()
                    .frame(width: 65, height: 55)
                    .foregroundColor(.blue)
                }
            Button(hideButtonOne ? "           " : "  \(stepDown)"){
                guard !hideButtonOne else { return }
                applyStepper(with: -1)
                }
            .foregroundColor(.white)
            }
            
            
                Text("x\(selectedNum)")
                    .font(.largeTitle)
            ZStack{
                if !hideButtonTwo {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: 65, height: 57)
                    .foregroundColor(.blue)
                }
            Button(hideButtonTwo ? "           " : "  \(stepUp)    ."){
                guard !hideButtonTwo else { return }
                applyStepper(with: 1)
                }
            }
            .foregroundColor(.white)
            
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
        }else if selectedNum == 12{
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
            StepperButtons()
            ChoiceButtons(message: "4")
            ChoiceButtons(message: "6")
            ChoiceButtons(message: "19")
        }
    }
}
