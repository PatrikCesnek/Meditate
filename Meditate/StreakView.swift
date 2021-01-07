//
//  StreakView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 04/01/2021.
//

import SwiftUI

struct StreakView: View {
    @State private var streakNumber = 0
    var date = Date()
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            .ignoresSafeArea(edges: .all)
            DrawingView()
            Text("🔥 \(streakNumber)")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}
