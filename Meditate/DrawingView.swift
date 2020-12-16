//
//  DrawingView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//


import SwiftUI

struct Spirograph : Shape {
    let innerRadius : Int
    let outerRadius : Int
    let distance : Int
    let amount : CGFloat
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
        
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
                var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)

                x += rect.width / 2
                y += rect.height / 2

                if theta == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
        }
        
        return path
    }
}

struct DrawingView: View {
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)

            VStack {
                HStack {
                    Spacer(minLength: 400)

                    Spirograph(innerRadius: 135, outerRadius: 75, distance: 120, amount: 1)
                        .stroke(Color.white, lineWidth: 5)
                        .frame(width: 300, height: 300)
                }
                Spacer()
                HStack {
                    Spirograph(innerRadius: 135, outerRadius: 75, distance: 120, amount: 1)
                        .stroke(Color.white, lineWidth: 5)
                        .frame(width: 300, height: 300)
                    Spacer(minLength: 400)

                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
