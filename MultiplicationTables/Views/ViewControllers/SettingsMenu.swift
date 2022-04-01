//
//  SettingsMenu.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/28/22.
//

import SwiftUI

struct SettingsMenu: View {
    @StateObject var eqm    = EquationModel()
    var body: some View {
        
        VStack{
            Labels(titleLabel: "Select Times Table")
            StepperButtons(eq: eqm)
            Spacer()
            Labels(titleLabel: "How Many Questions?")
            QuestionButtons(eq: eqm)
            Spacer()
            ProgressButtons(message: "LET'S GO! 💪🏼", color:.green, eq: eqm)
                .padding(30)
        }
    }
}

struct SettingsMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenu()
    }
}
