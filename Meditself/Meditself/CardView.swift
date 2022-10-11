//
//  CardView.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            HStack{
                        //some code
                Image(systemName: card.iconName)
                    .padding(6)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBlue).opacity(0.2)))
            }
            Text(card.title)
                .font(.custom("Avenir-Heavy", size: 22))
            Text(card.subtitle)
                .font(.custom("Avenir-Medium", size: 16))
                .foregroundColor(Color(.systemGray))
            if let percentageText = card.percentageText {
                HStack{
                    Text(percentageText)
                        .font(.custom("Avenir-Medium", size: 16))
                        .foregroundColor(Color(.systemGray))
                    Spacer()
                    ProgressView(value: card.percentageComplete, total: 100)
                        .progressViewStyle(MeditationProgressViewStyle())
                        .scaleEffect(x: 1, y: 2)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 20)
    }
}

struct MeditationProgressViewStyle: ProgressViewStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGroupedBackground))
                .frame(height: 10)
            ProgressView(configuration)
                .accentColor(Color(.systemBlue))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .init(iconName: "moon", title: "Evening Exercise", subtitle: "1 Session", percentageComplete: 75))
    }
}
