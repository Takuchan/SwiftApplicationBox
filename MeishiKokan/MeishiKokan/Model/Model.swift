//
//  Model.swift
//  MeishiKokan
//
//  Created by 松村拓洋 on 2023/02/12.
//

import Foundation

struct Model:Identifiable,Codable{
    let id : UUID
    var full_name : String
    var register_account : [Accounts]
    
    init(id: UUID = UUID(),full_name: String ,register_account: [Accounts]) {
        self.id = id
        self.full_name = full_name
        self.register_account = register_account
    }
    
    
}

extension Model{
    struct Accounts : Identifiable,Codable{
        let id : UUID
        let service_name : String
        var user_id : String
        init(id: UUID = UUID(),service_name:String , user_id: String) {
            self.id = id
            self.service_name = service_name
            self.user_id = user_id
        }
    }
    
    struct Data{
        var full_name :String = ""
        var register_account : [Accounts] = []
    }
    
    var data:Data{
        Data(full_name: full_name, register_account:register_account)
    }
    
}

extension Model{
    static let sampleData:[Model] = [
        Model(full_name: "たく", register_account: [Accounts(service_name: "gh", user_id: "takuchan"),
                                                    Accounts(service_name: "gh", user_id: "takuchan"),
                                                    Accounts(service_name: "gh", user_id: "takuchan"),
                                                    Accounts(service_name: "gh", user_id: "takuchan"),])
    ]
}
