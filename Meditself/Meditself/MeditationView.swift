//
//  MeditationView.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import SwiftUI


struct MeditationView: View {
    @StateObject var meditationVM: MeditationViewModel
    @State private var showPlayer = false
    @State private var isMorningPV = false
    @State private var isEveningPV = false
    @State private var isLovePV = false
    @State private var isBreathPV = false
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Image
            
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            

            
            // MARK: Meditation Details
            
            ZStack {
                // MARK: Background
                
                
                
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 12) {
                    // MARK: Type & Duration
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Welcome, Ali")
                            .padding(.trailing, 90.0)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        
                        Spacer()

                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0..<1) {_ in
                                    Button(action: {isMorningPV = true}) {
                                        Text("Morning Exercise")
                                            .foregroundColor(.white)
                                            .font(.custom("Avenir-Medium", size: 22))
                                            .fontWeight(.heavy)
                                            .frame(width: 200, height: 200)
                                            .background(Color(.systemCyan))
                                            .cornerRadius(30)
                                            .padding(6)
                                    }
                                    .fullScreenCover(isPresented: self.$isMorningPV) {
                                        MorningPlayView(meditationVM: meditationVM)
                                    }

                                    Button("Evening Exercise") {
                                        isEveningPV = true
                                    }
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir-Medium", size: 22))
                                    .fontWeight(.heavy)
                                    .frame(width: 200, height: 200)
                                    .background(Color(.systemCyan))
                                    .cornerRadius(30)
                                    .padding(6)
                                    .fullScreenCover(isPresented: self.$isEveningPV) {
                                        EveningPlayView(meditationVM: meditationVM)
                                    }
                                    Button("Love-Kindness") {
                                        isLovePV = true
                                    }
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir-Medium", size: 22))
                                    .fontWeight(.heavy)
                                    .frame(width: 200, height: 200)
                                    .background(Color(.systemCyan))
                                    .cornerRadius(30)
                                    .padding(6)
                                    .fullScreenCover(isPresented: self.$isLovePV) {
                                        LovePlayView(meditationVM: meditationVM)
                                    }
                                    Button("Breath Awareness") {
                                        isBreathPV = true
                                    }
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir-Medium", size: 22))
                                    .fontWeight(.heavy)
                                    .frame(width: 200, height: 200)
                                    .background(Color(.systemCyan))
                                    .cornerRadius(30)
                                    .padding(6)
                                    .fullScreenCover(isPresented: self.$isBreathPV) {
                                        BreathPlayView(meditationVM: meditationVM)
                                    }
                                }
                            }
                        }
                    }
                    .font(.subheadline)
                    .opacity(0.7)
                    
                    // MARK: Title
                    Text(meditationVM.meditation.title)
                        .font(.title)
                    
                    // MARK: Play Button
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    // MARK: Description
                    Text(meditationVM.meditation.description)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
                
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static let morningPV = MeditationViewModel(meditation: Meditation.data)
    
    static var previews: some View {
        MeditationView(meditationVM: meditationVM)
            .environmentObject(AudioManager())
    }
}


