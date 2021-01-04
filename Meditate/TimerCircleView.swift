//
//  TimerCircleView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 03/01/2021.
//

import SwiftUI

//struct MeditationArc: Shape {
//    let timePassed: Int
//    let fullTime: Int
//    var timeRemaining: Int
//
//    private var degreesPerSecond: Double {
//        360.0 / Double(fullTime)
//    }
//   
//    private var endAngle: Angle {
//        Angle(degrees: (degreesPerSecond) * (Double(timePassed)))
//    }
//    func path(in rect: CGRect) -> Path {
//        let diameter = min(rect.size.width, rect.size.height) - 1.0
//        let radius = diameter / 2.0
//        let center = CGPoint(
//            x: rect.origin.x + rect.size.width / 2.0,
//            y: rect.origin.y + rect.size.height / 2.0
//        )
//        return Path { path in
//            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: endAngle, clockwise: false)
//        }
//    }
//}

struct TimerCircleView: View {
    let circleTimer = TimerModel().timer
//    @State private var timeRemaining = TimerModel().timeRemaining
//    @State private var timeElapsed = TimerModel().timeElapsed
//    @State private var fullTime = TimerModel().fullTime
    
    @State private var timeRemaining = 20
    @State private var timeElapsed: Float = 0.0
    @State private var fullTime = 20
    

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 22)
                
//            MeditationArc(timePassed: timeElapsed, fullTime: fullTime, timeRemaining: timeRemaining)
//                .stroke(lineWidth: 16)
//                .rotation(Angle(degrees: -90))
//                .foregroundColor(.blue)
            Circle()
                .trim(from: 0.0, to:  (100 / CGFloat(fullTime)) * (CGFloat(timeElapsed) / (CGFloat(fullTime) / 10)))
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                .rotation(Angle(degrees: -90))
                .foregroundColor(.blue)
            
            Text("\(timeRemaining)")
                .font(.title)
                
        }
        .onReceive(circleTimer) {_ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                timeElapsed += Float(fullTime) / 1000
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
