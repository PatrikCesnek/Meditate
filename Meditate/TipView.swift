//
//  TipView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 14/12/2020.
//

import SwiftUI

struct TipView: View {
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitle(Text("Tips"), displayMode: .inline)
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TipView()
        }
    }
}
