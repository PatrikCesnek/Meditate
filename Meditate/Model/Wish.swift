//
//  Wish.swift
//  Meditate
//
//  Created by Patrik Cesnek on 09/01/2021.
//

import Foundation

struct Wish: Identifiable, Codable {
    var id: UUID
    var title: String
    var message: String
    
    init(id: UUID = UUID(), title: String, message: String) {
        self.id = id
        self.title = title
        self.message = message
    }
}

extension Wish {
    static var data: [Wish] {
        [
            Wish(title: "Wish", message: ""),
            Wish(title: "Wish 1", message: ""),
            Wish(title: "Wish 2", message: "")
        ]
    
    }
}

extension Wish {
    
    struct Data {
        var title: String = ""
        var message: String = ""
    }
    
    var data: Data {
        return Data(title: title, message: message)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        message = data.message
    }
}
