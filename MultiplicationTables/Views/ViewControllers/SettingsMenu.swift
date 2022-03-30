//
//  SettingsMenu.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/28/22.
//

import SwiftUI

struct SettingsMenu: View {
    @State var userReady                = false
    @State var questionButton           = 5
    @State private var stepperAmount    = 3
    var body: some View {
        VStack{
            Labels(titleLabel: "Select Times Table")
            StepperButtons(selectedNum: $stepperAmount)
            Spacer()
            Labels(titleLabel: "How Many Questions?")
            QuestionButtons(selected: $questionButton)
            Spacer()
            ProgressButtons(message: "LET'S GO! 💪🏼", color:.green)
                .padding(30)
        }
    }
}

struct SettingsMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenu()
    }
}
