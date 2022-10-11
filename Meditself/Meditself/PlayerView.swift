//
//  PlayerView.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    var isMorningPV = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            // MARK: Background Image
            
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            // MARK: Blur View
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            if let player = audioManager.player {
            VStack(spacing: 32) {
                // MARK: Dismiss Button
                
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.black)
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }

                // MARK: Title
                
                Text(meditationVM.meditation.title)
                    .font(.custom("Avenir-Heavy", size: 38))
                    .foregroundColor(.black)
                
                Spacer()
                
                // MARK: Playback
                
                VStack(spacing: 5) {
                    // MARK: Playback Timeline
                    
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    // MARK: Playback Time
                    
                    HStack {
                        Text("0:00")
                        
                        Spacer()
                        
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                // MARK: Playback Controls
                
                HStack {
                    // MARK: Repeat Button
                    let color: Color = audioManager.isLooping ? .red : .white
                    PlaybackControlButton(systemName: "repeat", color: color) {
                        audioManager.toggleLoop()
                    }
                    
                    Spacer()
                    
                    // MARK: Backward Button
                    PlaybackControlButton(systemName: "gobackward.10") {
                        player.currentTime -= 10
                        
                    }
                    
                    Spacer()
                    
                    // MARK: Play/Pause Button
                    PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                        audioManager.playPause()
                    }
                    
                    Spacer()
                    
                    // MARK: Forward Button
                    PlaybackControlButton(systemName: "goforward.10") {
                        player.currentTime += 10
                    }
                    
                    Spacer()
                    
                    // MARK: Stop Button
                    PlaybackControlButton(systemName: "stop.fill") {
                        audioManager.stop()
                        dismiss()
                    }
                }
            }
            .padding(20)
            }
        }
        .onAppear {
//            AudioManager.shared.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    
    static var previews: some View {
        PlayerView(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}

