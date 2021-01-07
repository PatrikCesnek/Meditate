//
//  TimerModel.swift
//  Meditate
//
//  Created by Patrik Cesnek on 04/01/2021.
//

import Foundation

class TimerModel: ObservableObject {
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var fullTime: Int
    var timeRemaining: Int
    var timeElapsed: Int
    
    init(){
        fullTime = 20
        timeRemaining = self.fullTime
        timeElapsed = 0
    }
}
