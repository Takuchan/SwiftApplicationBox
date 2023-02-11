//
//  ContentView.swift
//  Codable
//
//  Created by 松村拓洋 on 2023/02/05.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Model.sampledata
    @State private var stopOngen : Bool = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action:{
                stopOngen.toggle()
            }){
                Text("音源スタートORストップ" + String(stopOngen))
            }
            List{
                ForEach($data){$result in
                    
                    NavigationLink(destination: EditView(data: $result, stopOngen: $stopOngen)){
                        Text(result.title)
                            
                    }
                    
                }
            }
            Button(action:{
                print(data)
            }){
                Text("おして")
            }
//            NavigationLink(destination:EditView(data: data, stopOngen: $stopOngen)){
//                Text("次へ")
//            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
