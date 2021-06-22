//
//  WishlistView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 05/01/2021.
//

import SwiftUI

struct WishlistView: View {
    @State var wish: Wish
    @State var isPresented = false
    @State var wishNumber = 0
    @State private var data: Wish.Data = Wish.Data()

    
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.88, blue: 0.42)
            .ignoresSafeArea(edges: .all)
            
            List {
                ForEach(Wish.data) { wish in
                    Text(wish.title)
                }
            }
            .onAppear {
                wishNumber = Wish.data.count - 1
            }
        }.navigationBarItems(trailing: Button(action: {
            isPresented = true
            data = wish.data
        }) {
          Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(data: $data)
                    .navigationBarItems(leading: Button("Dissmiss"){
                        isPresented = false
                    }, trailing: Button("Add"){
                        isPresented = false
                        wish.update(from: data)
                     })
            }
        }
        .navigationTitle(Text("Wishlist"))
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WishlistView(wish: Wish.data[0])
        }
    }
}
