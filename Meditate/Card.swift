//
//  Card.swift
//  Meditate
//
//  Created by Patrik Cesnek on 16/12/2020.
//

import Foundation

struct Card: Codable {
//    var tips = ["Try to meditate at least once a day", "Be patient and treat yourself with kindness, as it can be difficult to learn how to pay attention to your breath and sit for meditation.", "Meditating for just five to 10 minutes each day can help reduce stress.","Go into your meditation practice without expectations.", "Choose a time to meditate, and stick to it.", "Create a designated space to meditate.", "Take a couple moments to wind down and clear your mind.", "Start with a few deep breaths to calm the body.", "Try not to fidget or move too much during meditation.", "Just breathe.", "Be kind to yourself — some days will be easier than others.", "Slowly reintroduce movement after meditating.", "Acknowledge your emotions.", "Come back the next day, even if you don't feel like it.", "Try to stick with it for 21 days to create a habbit."]
    
    let tip: String
    
    static var example: Card {
            Card(tip: "Try to calm your mind.")
        }
}
