//
//  model.swift
//  CreateRow
//
//  Created by 松村拓洋 on 2023/02/11.
//

import Foundation

//最初に入力される構造体
struct Model: Identifiable{
    let id : UUID
    var bols : [Attendee]
    
    init(id : UUID = UUID(),bols:[Int]){
        self.id = id
        self.bols = bols.map{Attendee(attend: $0)}
    }
}
extension Model{
    struct Attendee:Identifiable{
        let id : UUID
        let attend : Int
        init(id : UUID = UUID(), attend: Int){
            self.id = id
            self.attend = attend
        }
    }

    
    //編集する用の構造体
    struct Data{
        var bols : [Attendee] = []
    }
    
    var data:Data{
        Data(bols: bols)
    }
   
}

extension Model{
    static let sampleData: [Model] = [Model(bols: [12,3,4,2])
    ]
}
