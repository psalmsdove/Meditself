//
//  MedidationViewModel.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 Minute Relaxing", description: "If you are new to the meditation, you can start immediately now. Clear your mind with this quick exercise. Breathe with the music.", duration: 70, track: "meditation1", image: "med1")
}
