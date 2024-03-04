//
//  OpenAIChatApp.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//

import SwiftUI

@main
struct OpenAIChatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
