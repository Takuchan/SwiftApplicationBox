//
//  ViewController.swift
//  PrimeJudge
//
//  Created by 松村拓洋 on 2022/11/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var primeText: UILabel!
    @IBOutlet weak var evenText: UILabel!
    
    var count : Int = 0;
    @IBOutlet weak var countText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countText.delegate = self
    }
    
    

    @IBAction func plusbutton(_ sender: Any) {
        count = count + 1;
        countText.text = String(count)
        if(judgePrime(num: count)){
            primeText.text = "素数"
            if(count < 2){
                primeText.text = "判別不可"
            }
        }else{
            primeText.text = "合成数"
            if(count < 2){
                primeText.text = "判別不可"
            }
        }
        if(judgeEven(number: count)){
            evenText.text = "偶数"
            evenText.textColor = UIColor.red
        }else{
            evenText.text = "奇数"
            evenText.textColor = UIColor.blue
        }
    }
    
    @IBAction func minusbutton(_ sender: Any) {
        count = count - 1;
        countText.text = String(count);
        if(judgePrime(num: count)){
            primeText.text = "素数"
            if(count < 2){
                primeText.text = "判別不可"
            }
        }else{
            primeText.text = "合成数"
            if(count < 2){
                primeText.text = "判別不可"
            }
        }
        if(judgeEven(number: count)){
            evenText.text = "偶数"
            evenText.textColor = UIColor.red
        }else{
            evenText.text = "奇数"
            evenText.textColor = UIColor.blue
        }
    }
    
    func judgeEven(number:Int) -> Bool{
        if (number % 2 == 0){
            return true
        }else{
            return false
        }
    }
    func judgePrime(num: Int) -> Bool{
        var booljudge : Bool = true;
        if(num < 2){
            
        }else{
            for i in 2..<num{
                if(num % i == 0){
                    booljudge = false
                    break;
                }
            }
        }
        
        return booljudge;
        
    }
    
}

extension ViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        countText.keyboardType = UIKeyboardType.numberPad;
        if countText.text == nil || countText.text!.isEmpty{
            count = 0;
            countText.text = String(0)
        }else{
            count = Int(countText.text!)!
            
        }
        
       }
}
