//
//  CustomTableViewCell.swift
//  JudgeAIAge
//
//  Created by 松村拓洋 on 2022/11/13.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fromTextcell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var messageTextCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCell.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// 画像・タイトル・説明文を設定するメソッド
        func setCell(imageName: String, titleText: String, descriptionText: String) {
            imageCell.image = UIImage(named: imageName)
            fromTextcell.text = titleText
            messageTextCell.text = descriptionText
        }

}
