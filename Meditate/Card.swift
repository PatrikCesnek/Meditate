//
//  Card.swift
//  Meditate
//
//  Created by Patrik Cesnek on 16/12/2020.
//

import Foundation

struct Card: Codable {    
    var tip: String
    
    static var example: Card {
            Card(tip: "Try to calm your mind.")
        }
}
