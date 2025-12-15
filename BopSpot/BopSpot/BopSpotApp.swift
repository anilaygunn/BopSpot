//
//  BopSpotApp.swift
//  BopSpot
//
//  Created by Anıl Aygün on 26.11.2025.
//

import SwiftUI

@main
struct BopSpotApp: App {
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
