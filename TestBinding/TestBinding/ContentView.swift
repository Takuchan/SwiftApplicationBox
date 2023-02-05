//
//  ContentView.swift
//  TestBinding
//
//  Created by 松村拓洋 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        VStack {
            Text("お前の入力した文字は")
            Text(text)
                .font(.largeTitle)
            TextField("入力せよ",text: $text)
                .padding()
            NavigationLink(destination:SecondView(text: $text)){
                Text("次へ")
            }
        }
        .padding()
        .navigationTitle("BindingTest")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        
    }
}
