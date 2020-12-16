//
//  StartView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct StartView: View {
    var durationView = DurationView()
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
                Text("\(duration)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Button(action: {
                    //Start the counter
                    isActive.toggle()
                }, label: {
                    Text("Start")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                })
            }
            .onReceive(secondsTimer) { _ in
                if isActive {
                    if secondsRemaining > 0 {
                        secondsRemaining -= 1
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarItems(trailing: NavigationLink("Duration", destination: ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
                .edgesIgnoringSafeArea(.all)

            Picker("Choose duration", selection: $duration) {
                ForEach(0..<Self.durations.count) {
                    if Self.durations[$0] != 1 {
                        Text("\(Self.durations[$0]) minutes")
                    } else {
                        Text("\(Self.durations[$0]) minute")
                    }
                }
                .foregroundColor(.white)
                .font(.title)
            }
        }
        )).foregroundColor(.white)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
        
    }
}
