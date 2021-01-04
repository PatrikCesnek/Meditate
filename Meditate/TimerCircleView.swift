//
//  TimerCircleView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 03/01/2021.
//

import SwiftUI

struct MeditationArc: Shape {
    let timePassed: Int
    let fullTime: Int
    var timeRemaining: Int

    private var degreesPerSecond: Double {
        360.0 / Double(fullTime)
    }
   
    private var endAngle: Angle {
        Angle(degrees: (degreesPerSecond) * (Double(timePassed)))
    }
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 1.0
        let radius = diameter / 2.0
        let center = CGPoint(
            x: rect.origin.x + rect.size.width / 2.0,
            y: rect.origin.y + rect.size.height / 2.0
        )
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: endAngle, clockwise: false)
        }
    }
}

struct TimerCircleView: View {
    let secondsTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var secondsRemaining = 20
    @State private var secondsElapsed = 0
    @State private var fullTime = 20

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 22)
                
            MeditationArc(timePassed: secondsElapsed, fullTime: fullTime, timeRemaining: secondsRemaining)
                .stroke(lineWidth: 16)
                .rotation(Angle(degrees: -90))
                .foregroundColor(.blue)
        }
        .onReceive(secondsTimer) {_ in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
                secondsElapsed += 1
            }
        }
        .padding(.horizontal)
    }
}

struct TimerCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCircleView()
    }
}
