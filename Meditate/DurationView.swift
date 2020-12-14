//
//  DurationView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct DurationView: View {
    @State var duration = 0
    
    static let durations = [1, 3, 5, 10, 15, 20, 25, 30, 45, 60]
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            VStack {
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
                .padding()
                
                Button("Select") {
                    self.duration = duration
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal)
                .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                .padding(.bottom, 5)
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DurationView_Previews: PreviewProvider {
    static var previews: some View {
        DurationView()
    }
}
