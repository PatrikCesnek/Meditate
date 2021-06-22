//
//  StartView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI
import AVFoundation

struct StartView: View {
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    let secondsTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var secondsRemaining = 0
    @State private var secondsElapsed: Float = 0
    @State private var duration = 0
    static let durations = [1, 3, 5, 10, 15, 20, 25, 30, 45, 60]
    @State private var isActive = false
    
    @State private var fullTime = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            DrawingView()
            VStack {
//                Text("\(hoursRemaining) : \(minutesRemaining) : \(secondsRemaining)") 
                if isActive {
                    ZStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 20)
//                                .foregroundColor(Color(red: 0.20, green: 0.88, blue: 0.42))
                                .foregroundColor(.secondary)
                            Circle()
                                .trim(from: 0.0, to: (100 / CGFloat(fullTime)) * CGFloat(secondsElapsed) / (CGFloat(fullTime) / 10))
                                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                                .rotation(Angle(degrees: -90))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        .frame(width: 350, height: 350)

                        Text("\(secondsRemaining)")
                            .onReceive(secondsTimer) { _ in
                                if secondsRemaining > 0 {
                                    countDown()
                                } else {
                                    resetTimer()
                                }
                            }
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        
                    }
                    Button(action: {stopCounter()}, label: {
                        Text("Stop")
                    })
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                    .padding(.bottom, 5)
                } else {
                    VStack {
                        Text("How long do you want to meditate?")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(minWidth: 200, idealWidth: 200, maxWidth: 300, minHeight: 50, idealHeight: 80, maxHeight: 80)
                            .shadow(color: .black, radius: 5, x: 1, y: 1)
                        Picker("Choose duration", selection: $duration) {
                            ForEach(0..<Self.durations.count) {
                                if Self.durations[$0] != 1 {
                                    Text("\(Self.durations[$0]) minutes")
                                } else {
                                    Text("\(Self.durations[$0]) minute")
                                }
                            }.foregroundColor(.white)
                            .font(.title)
                        }
                    }
                    Button(action: {startCounter()}, label: {
                        Text("Start")
                    })
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                    .padding(.bottom, 5)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func startCounter() {
        fullTime = Self.durations[duration]
        secondsRemaining = fullTime
        isActive = true
    }
    
    
    
    func resetTimer() {
        player.play()
        fullTime = 0
        secondsElapsed = 0
    }
    
    func countDown() {
        secondsRemaining -= 1
        secondsElapsed += Float(fullTime) / 1000
    }
    
    func stopCounter() {
        resetTimer()
        isActive = false
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
        
    }
}
