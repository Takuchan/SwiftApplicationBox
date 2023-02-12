//
//  ContentView.swift
//  QrCodeCcreator
//
//  Created by 松村拓洋 on 2023/02/12.
//

import SwiftUI

struct ContentView: View {
    private let qrCodeGenerator = QRcodeGenerator()
    @State private var qrCodeImage : UIImage?
    
    var body: some View {
        VStack(spacing: 16) {
            if let qrCodeImage{
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .frame(width: 200,height: 200)
            }else{
                Button(action:{
                    qrCodeImage = qrCodeGenerator.generate(with: "https://github.com/takuchan")?.composited(withSmallCenterImage: UIImage(named: "github")!)
                }){
                    Text("生成")
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
