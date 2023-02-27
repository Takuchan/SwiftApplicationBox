//
//  ContentView.swift
//  List
//
//  Created by 松村拓洋 on 2023/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List{
                ForEach(0..<30){ num in
                    Text("\(num)")
                }
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
