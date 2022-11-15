//
//  ViewController.swift
//  TwoFinger
//
//  Created by 松村拓洋 on 2022/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texttest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        texttest.text = "ラヴェル"
    }
    
    

    @IBAction func gesturepinch(_ sender: UIPinchGestureRecognizer) {
        texttest.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
}

