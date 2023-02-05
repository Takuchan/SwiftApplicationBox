//
//  MusicPlay.swift
//  Codable
//
//  Created by 松村拓洋 on 2023/02/05.
//

import Foundation
import AVFoundation
import SwiftUI


struct MusicPlay{
    static let ongen = try!  AVAudioPlayer(data: NSDataAsset(name: "64kbpsSubtitle")!.data)
    static func play(){
        MusicPlay.ongen.currentTime = 0.0
        MusicPlay.ongen.play()
    }
    
    static func stop(){
        MusicPlay.ongen.stop()
    }

}
