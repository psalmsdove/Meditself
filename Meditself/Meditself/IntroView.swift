//
//  IntroView.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 30.10.2022.
//

import SwiftUI

struct IntroView: View {
    @StateObject var meditationVM: MeditationViewModel
    @State private var showMeditationView = false
    @State var showWalkthroughScreens: Bool = false
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            
            IntroScreen()
            WalkThroughScreens()
            NavBar()
        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkthroughScreens)
    }
    
    @ViewBuilder
    func WalkThroughScreens() -> some View{
        GeometryReader{
            let size = $0.size
            
            ZStack{
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom){
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 55, height: 55)
                    .background{
                        RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color(.black))
                    }
                    .onTapGesture {
                        
                    }
                    .offset(y: -100)
            }
            .offset(y: showWalkthroughScreens ? 0 : size.height)
        }
    }
    
    @ViewBuilder
    func NavBar() -> some View{
        HStack{
            Button {
                //
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    func IntroScreen() -> some View{
        GeometryReader{
            let size = $0.size
            NavigationView{
                VStack(spacing: 10){
                    Text("clear head")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 300)
                        .frame(alignment: .center)
                    Text("you can instantly clear your mind from bad thoughts, get relief and focus on your work with these awesome exercises that we'll give you.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    Button("begin") {
                       showMeditationView = true
                    }
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 4.0)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(.black)))
                    .foregroundColor(.white)
                    .fullScreenCover(isPresented: self.$showMeditationView) {
                        MeditationView(meditationVM: meditationVM)
                            .onTapGesture {
                                showWalkthroughScreens.toggle()
                            }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: showWalkthroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        IntroView(meditationVM: meditationVM)
    }
}
