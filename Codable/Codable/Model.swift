//
//  Model.swift
//  Codable
//
//  Created by 松村拓洋 on 2023/02/05.
//

import Foundation

struct Model:Identifiable, Codable{
    let id : UUID
    var title : String
    var subtitle : String
    
    init(id: UUID = UUID(), title: String, subtitle: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }
}

extension Model{
    static let sampledata : [Model] = [
        Model(title: "おはよう", subtitle: "朝の挨拶"),
        Model(title: "こんにちは", subtitle: "昼の挨拶"),
        Model(title: "こんばんは", subtitle: "夜の挨拶")
    ]
}
