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
            .shadow(radius: 5)
        }
    }


    struct QuestionButtons: View {
        @Binding var selected: Int
        var numbers = [5,10,15,20]
        var body: some View {
            HStack(spacing: 20){
                ForEach(numbers, id: \.self){ number in
                    Button("\(number)"){
                        withAnimation {
                            selected = number
                        }
                    }
                            .frame(width: 60, height: 60)
                            .background(selected == number ? .green : .teal)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                }
            }
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
            .shadow(radius: 5)
            .foregroundColor(.black)
        }
    }
    

    struct StepperButtons: View {
        @State private var stepDown     = 2
        @Binding var selectedNum: Int
        @State private var stepUp       = 4
        @State private var hideButtonOne    = false
        @State private var hideButtonTwo    = false
        
        var body: some View {
            VStack{
                HStack(spacing: 30) {
                    ZStack{
                        if !hideButtonOne {
                            Image(systemName: "arrowtriangle.left.fill")
                                .resizable()
                                .frame(width: 65, height: 55)
                                .foregroundColor(.blue)
                                .shadow(radius: 5)
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
                                .shadow(radius: 5)
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
            Text("Ex: 2 x 2")
        }
        
        
        func setSelection() -> Int{
            return selectedNum
        }
        
        func applyStepper(with number: Int){
            
            stepUp += number
            selectedNum += number
            stepDown += number
            withAnimation {
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
    }
    

    struct Buttons_Preview: PreviewProvider {
        static var previews: some View {
            VStack(spacing: 30){
                StatefulPreviewWrapper(3) {StepperButtons(selectedNum: $0)}
                            ChoiceButtons(message: "4")
                            ProgressButtons(message: "NEXT ->", color: .green)
            }
        }
    }



//Used to preview structs with @Binding properties

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}
