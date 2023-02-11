//
//  CreateRowApp.swift
//  CreateRow
//
//  Created by 松村拓洋 on 2023/02/11.
//

import SwiftUI

@main
struct CreateRowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(models: Model.sampleData[0].data)
        }
    }
}
