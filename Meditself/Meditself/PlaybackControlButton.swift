//
//  PlaybackControlButton.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import SwiftUI

struct PlaybackControlButton: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlaybackControlButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlButton(action: {})
            .preferredColorScheme(.dark)
    }
}
