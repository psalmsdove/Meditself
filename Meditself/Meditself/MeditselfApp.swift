//
//  MeditselfApp.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import SwiftUI

@main
struct MeditationApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
