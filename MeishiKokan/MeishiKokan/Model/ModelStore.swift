//
//  ModelStore.swift
//  MeishiKokan
//
//  Created by 松村拓洋 on 2023/02/12.
//

import Foundation
import SwiftUI

class ModelStore : ObservableObject{
    @Published var model : [Model] = []
    
    private static func fileURL() throws -> URL{
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("model.data")
    }
}
