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
    static func load(completion: @escaping (Result<[Model], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do{
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else{
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyModel = try JSONDecoder().decode([Model].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyModel))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }
    }
    static func save(models: [Model], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(models)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(models.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
