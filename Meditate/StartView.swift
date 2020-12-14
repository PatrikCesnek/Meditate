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

    @State private var isActive = false

    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            VStack {
//                Text("\(hoursRemaining) : \(minutesRemaining) : \(secondsRemaining)")
                Text("\(secondsRemaining)")
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
        .navigationBarItems(trailing: NavigationLink("Duration", destination: DurationView())).foregroundColor(.white)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StartView()
        }
    }
}
