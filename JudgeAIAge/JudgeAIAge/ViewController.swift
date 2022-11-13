//
//  ViewController.swift
//  JudgeAIAge
//
//  Created by 松村拓洋 on 2022/11/13.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    

    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    
    var count : Int = 0
    var talkhistory = ["私は何歳か当ててみよう！"]
    var talkpeople = ["あーたん"]
    var imagetalker = ["woman.png"]
    var randomcount : Int = Int.random(in: 4..<20)
    /// 画像のファイル名

        

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            inputField.delegate = self
           
            
            print("ランダムの数字は"+String(randomcount))
            NotificationCenter.default.addObserver(self,
                                                      selector: #selector(keyboardWillShow),
                                                      name: UIResponder.keyboardWillShowNotification,
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(keyboardWillHide),
                                                      name: UIResponder.keyboardWillHideNotification,
                                                      object: nil)
            
            
        }
    
    @IBAction func sendButton(_ sender: Any) {
        var getText = inputField.text!
        count = Int(getText)!
        inputField.text = ""
        talkhistory.append(getText)
        talkpeople.append("オタクくん")
        imagetalker.append("otaku.png")
        self.loadView()
        self.viewDidLoad()
       
        if(count == randomcount){
            print("同じになりました")
        }
        
        if(count < randomcount){
            talkhistory.append("もっとお姉さんだよ")
            talkpeople.append("あーたん")
            imagetalker.append("woman.png")
        }else if (count == randomcount){
            talkhistory.append("🫶")
            talkpeople.append("あーたん")
            imagetalker.append("woman.png")
        }else{
            talkhistory.append("もっと若いよ")
            talkpeople.append("あーたん")
            imagetalker.append("woman.png")
        }
        
        
        
    }
    /// セルの個数を指定するデリゲートメソッド（必須）
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return talkhistory.count
            }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
     
            cell.imageCell.image = UIImage(named:imagetalker[indexPath.row])
            cell.messageTextCell.text = talkhistory[indexPath.row]
            cell.fromTextcell.text = talkpeople[indexPath.row]
            cell.backgroundView = nil
            return cell
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

