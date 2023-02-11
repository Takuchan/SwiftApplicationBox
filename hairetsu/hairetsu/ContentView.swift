//
//  ContentView.swift
//  hairetsu
//
//  Created by 松村拓洋 on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    @State private var list : [String] = []
    var count : Int = 0
    var body: some View {
        VStack {
            Button(action: {
                let days = 31
                let firstDay = 2
                var w = 0
                while w < firstDay {
                    print("    ",terminator: "")
                    w+=1
                }
                var d = 1
                loop
            }){
               Text("ここほれ")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
