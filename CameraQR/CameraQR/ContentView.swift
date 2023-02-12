//
//  ContentView.swift
//  CameraQR
//
//  Created by 松村拓洋 on 2023/02/11.
//

import SwiftUI
import AVFoundation

enum RecordingStatus{
    case ready
    case start
    case stop
    
}

public protocol CameraViewDelegate:AnyObject{
    func didFinishRecording(outputFileURL:URL)
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
