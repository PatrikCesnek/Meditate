//
//  ContentView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    var wishesExample = ["Wish", "Another Wish", "One fucking more"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.20, green: 0.88, blue: 0.42)
                .ignoresSafeArea(edges: .all)
                DrawingView()

                VStack {
                    NavigationLink("Start", destination: StartView())
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                    NavigationLink("Tips", destination: TipView())
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                    NavigationLink("Streak", destination: StreakView()
                                    .padding())
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                    NavigationLink("Wish List", destination: WishlistView(wishes: wishesExample).padding())
                        .padding(.horizontal)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .padding(.bottom, 5)
                }
                .font(.title)
                .foregroundColor(.white)
            }
            .navigationBarTitle(Text("Meditate"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
