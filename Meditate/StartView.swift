//
//  StartView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct StartView: View {
    let secondsTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    @State var secondsRemaining = 10
    @State private var duration = 0
    static let durations = [1, 3, 5, 10, 15, 20, 25, 30, 45, 60]
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            DrawingView()
            VStack {
//                Text("\(hoursRemaining) : \(minutesRemaining) : \(secondsRemaining)")
                if isActive {
                    ZStack {
                        TimerCircleView()
                            .frame(width: 400, height: 400)
                        Text("\(secondsRemaining)")
                            .onReceive(secondsTimer) { _ in
                                if secondsRemaining > 0 {
                                    secondsRemaining -= 1
                                }
                            }
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                } else {
                    VStack {
                        Text("How long do you want to meditate?")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(minWidth: 200, idealWidth: 200, maxWidth: 300, minHeight: 50, idealHeight: 80, maxHeight: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 1, y: 1)
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
                }
                
                Button(action: {
                    //Starts the counter
                    //Add *60 to seconds remaining so it would have correct options, this version is just for testing!!!
                    secondsRemaining = Self.durations[duration]
                    isActive.toggle()
                }, label: {
                    if !isActive {
                        Text("Start")
                    } else {
                        Text("Stop")
                    }
                })
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal)
                .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                .padding(.bottom, 5)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
        
    }
}
