//
//  StartView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct StartView: View {
    var duration = DurationView()
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            VStack {
                Text("0 : 00 : 00")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Button(action: {
                    //Start the counter
                }, label: {
                    Text("Start")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                })
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
