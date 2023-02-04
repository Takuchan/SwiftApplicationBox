//
//  SecondView.swift
//  TestBinding
//
//  Created by 松村拓洋 on 2023/02/04.
//

import SwiftUI

struct SecondView: View {
    @Binding var text : String
    var body: some View {
        VStack{
            Text("最新のVALUE")
            Text(text)
                .font(.title2)
                .foregroundColor(Color.red)
            TextField("テキストなし",text: $text)
                .padding()
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(text: .constant("Tessst"))
    }
}
