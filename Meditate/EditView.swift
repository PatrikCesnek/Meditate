//
//  EditView.swift
//  Meditate
//
//  Created by Patrik Cesnek on 07/01/2021.
//

import SwiftUI

struct EditView: View {
    @Binding var data: Wish.Data
    @State var newWish = Wish(title: "", message: "")
    
    var body: some View {
        List {
//            Section(header: Text("Wishes")) {
//                ForEach(0..<wishes.count) { wish in
//                    VStack {
//                        Text(wishes[wish].title)
//                        Text(wishes[wish].message)
//                    }
//                }
//            }
            Section(header: Text("Add your wish")) {
                VStack {
                    TextField("Title", text: $newWish.title)
                    TextField("Message", text: $newWish.message)
                    Button("Add wish") {
                        data.title.append(newWish.title)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(data: .constant(Wish.Data()), newWish: Wish(title: "Title", message: ""))
    }
}
