//
//  ViewController.swift
//  KidInputAccessoryView
//
//  Created by Kid Tsui on 2019/6/27.
//  Copyright © 2019 Kid Tsui. All rights reserved.
//

// Adding a inputAccessoryView with UITextField MUST implement 3 things in UIViewController
// 1. override var inputAccessoryView: UIView? , return the custom view (such as `inputContainer`)
// 2. override var canBecomeFirstResponder: Bool, return true
// 3. `inputContainer` MUST NOT BE added as a subview in viewController

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    let inputContainer = kInputAccessoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputContainer.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(edit))
        tap.cancelsTouchesInView = false
        contentLabel.addGestureRecognizer(tap)
        contentLabel.isUserInteractionEnabled = true
    }
    
    @objc func edit() {
        inputContainer.becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var inputAccessoryView: UIView? {
        return inputContainer
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touches.first,
            touch.view == contentLabel {
            print("contentLabel")

//            inputContainer.becomeFirstResponder()
        } else {
            contentLabel.text = inputContainer.text
            inputContainer.resignFirstResponder()
        }
    }
}

extension ViewController: kInputAccessoryViewDelegate {
    func accessoryViewShouldReturn(_ view: kInputAccessoryView, text: String?) {
        contentLabel.text = text
    }
}
