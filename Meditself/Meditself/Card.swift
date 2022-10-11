//
//  Card.swift
//  Meditself
//
//  Created by Ali Erdem Kökcik on 11.10.2022.
//

import Foundation

struct Card {
    let iconName: String
    let title: String
    let subtitle: String
    let percentageComplete: Double?
    var percentageText: String? {
        guard let percentageComplete = percentageComplete else {
            return nil
        }
        return "\(percentageComplete)%"
    }
}
