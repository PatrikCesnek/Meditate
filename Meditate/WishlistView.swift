//
//  WishlistView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 05/01/2021.
//

import SwiftUI

struct WishlistView: View {
    @State var wishes: [String]
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            .ignoresSafeArea(edges: .all)
            
            List {
                ForEach(wishes, id: \.self) { wish in
                    Text(wish)
                }
            }
        }.navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
          Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView()
                    .navigationBarItems(leading: Button("Dissmiss"){
                        isPresented = false
                    }, trailing: Button("Add"){
                        isPresented = false 
                    })
            }
        }
        .navigationTitle(Text("Wishlist"))
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var wishesExample = ["wish", "some other Wish"]
    static var previews: some View {
        NavigationView {
            WishlistView(wishes: wishesExample)
        }
    }
}
