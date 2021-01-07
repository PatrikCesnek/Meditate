//
//  CardView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 16/12/2020.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled

    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(
                            Color(red: 0.20, green: 0.88, blue: 0.42))
                        .shadow(radius: 10)
                    VStack {
                        if accessibilityEnabled {
                            Text(card.tip)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        } else {
                            Text(card.tip)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            }
                        }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }
            .frame(width: 300, height: 450)
            .rotationEffect(.degrees(Double(offset.width / 5)))
            .offset(x: offset.width * 5, y: 0)
            .opacity(2 - Double(offset.width / 50))
            .accessibility(addTraits: .isButton)
            .gesture (
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        feedback.prepare()
                    }
                )
            .animation(.spring())
        }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
