//
//  QRcodeGenerator.swift
//  QrCodeCcreator
//
//  Created by 松村拓洋 on 2023/02/12.
//

import Foundation
import SwiftUI
import UIKit

struct QRcodeGenerator{
    //    生成を行う関数
    func generate(with inputText:String) -> UIImage?{
        guard let qrfilter = CIFilter(name: "CIQRCodeGenerator")
        else{return nil}
        
        let inputData = inputText.data(using: .utf8)
        qrfilter.setValue(inputData, forKey: "inputMessage")
        qrfilter.setValue("H", forKey: "inputCorrectionLevel")
        
        guard let ciImage = qrfilter.outputImage
        else {return nil}
        
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let scaleCiImage = ciImage.transformed(by: sizeTransform)
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaleCiImage, from: scaleCiImage.extent)
        else {return nil}
        
        return UIImage(cgImage:cgImage)
        
    }
    
}
extension UIImage{
    func composited(withSmallCenterImage centerImage: UIImage) -> UIImage {
        return UIGraphicsImageRenderer(size: self.size).image { context in
            let imageWidth = context.format.bounds.width
            let imageHeight = context.format.bounds.height
            let centerImageLength = imageWidth < imageHeight ? imageWidth / 4 : imageHeight / 4
            let centerImageRadius = centerImageLength * 0.2
            
            // 背面に設置する親画像を描画
            draw(in: CGRect(origin: CGPoint(x: 0, y: 0),
                            size: context.format.bounds.size))
            
            // 中心に設置する画像のrectを設定
            let centerImageRect = CGRect(x: (imageWidth - centerImageLength) / 2,
                                         y: (imageHeight - centerImageLength) / 2,
                                         width: centerImageLength,
                                         height: centerImageLength)
            
            // 画像に角丸をつける為のパスを作成
            let roundedRectPath = UIBezierPath(roundedRect: centerImageRect,
                                               cornerRadius: centerImageRadius)
            // クリッピングパスを追加
            roundedRectPath.addClip()
            
            // 中心に設置する画像を描画
            centerImage.draw(in: centerImageRect)
        }
    }
}
