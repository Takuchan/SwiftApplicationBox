//
//  ViewController.swift
//  JudgeAIAge
//
//  Created by 松村拓洋 on 2022/11/13.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    

    

//    @IBOutlet weak var tablebottom: NSLayoutConstraint!
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    /// 画像のファイル名
        let imageNames = ["woman.png"]
        
        /// 画像のタイトル
        let imageTitles = ["ネコ1", "ネコ2", "イヌ1", "イヌ2"]
        
        /// 画像の説明
        let imageDescriptions = [
            "ボックスから顔だけだして下を見ているオス猫",
            "寝ころびながらじゃれる猫",
            "散歩中のポメラニアン",
            "お散歩中のワンちゃん"
        ]
     
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            NotificationCenter.default.addObserver(self,
                                                      selector: #selector(keyboardWillShow),
                                                      name: UIResponder.keyboardWillShowNotification,
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(keyboardWillHide),
                                                      name: UIResponder.keyboardWillHideNotification,
                                                      object: nil)
            
            
        }
    @objc private func keyboardWillShow(_ notification: Notification) {
        // キーボードが現れる時の処理
        guard let keyboardHeight = notification.keyboardHeight,
                  let keyboardAnimationDuration = notification.keybaordAnimationDuration,
                  let KeyboardAnimationCurve = notification.keyboardAnimationCurve
            else { return }

        UIView.animate(withDuration: keyboardAnimationDuration,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: KeyboardAnimationCurve)) {
            self.viewBottom.constant = keyboardHeight - self.view.safeAreaInsets.bottom
           

            }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        // キーボードが閉じる時の処理
        guard let keyboardAnimationDuration = notification.keybaordAnimationDuration,
                  let KeyboardAnimationCurve = notification.keyboardAnimationCurve
            else { return }

            UIView.animate(withDuration: keyboardAnimationDuration,
                           delay: 0,
                           options: UIView.AnimationOptions(rawValue: KeyboardAnimationCurve)) {
//                self.intputField.constant = 0
//                self.sendButton.constant = 0
                self.viewBottom.constant = 0
        
            }
    }
     
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
     
        
    
        /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageTitles.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        let img = UIImage(named: "woman.png")
        cell.imageCell.image = img
        
        cell.fromTextcell.text = "aiueo"
        cell.messageTextCell.text = "aiueee"
        return cell
    }

}
extension Notification {

    // キーボードの高さ
    var keyboardHeight: CGFloat? {
        return (self.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
    }

    // キーボードのアニメーション時間
    var keybaordAnimationDuration: TimeInterval? {
        return self.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    }

    // キーボードのアニメーション曲線
    var keyboardAnimationCurve: UInt? {
        return self.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
    }
}

