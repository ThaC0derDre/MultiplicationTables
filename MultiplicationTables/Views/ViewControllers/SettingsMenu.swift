//
//  SettingsMenu.swift
//  MultiplicationTables
//
//  Created by Andres Gutierrez on 3/28/22.
//

import SwiftUI

struct SettingsMenu: View {
    @StateObject private var settingsData   = SettingsData()
    @State private var showChallengeView    = false
    
    var body: some View {
        
        VStack{
            Labels(titleLabel: "Select Times Table")
            StepperButtons()
            Spacer()
            Labels(titleLabel: "How Many Questions?")
            QuestionButtons()
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
