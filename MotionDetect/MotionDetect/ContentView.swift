//
//  ContentView.swift
//  MotionDetect
//
//  Created by 松村拓洋 on 2023/02/25.
//

import SwiftUI


struct ContentView: View {
    @State private var currentInd = 1
    @State var label: String = "Hellow"
    var photos = ["cat","dog"]
    let model = MobileNetV2FP16()
    var body: some View {
        VStack {
            Text(label)
            Image(photos[currentInd])
            Button("この画像は何？"){

            }
        }
        .padding()
    }

    private func classfication(){
         let currentImageName = photos[currentInd]
         let img = UIImage(named: currentImageName)
         guard  let resized = img?.resizeTo(CGSize(width: 224, height: 224)),
         let buffer = resized.toBuffer() else {return}
         let output = try? model.prediction(image: buffer)
         if let output = output{
             self.label = output.classLabel
         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
