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
    
    let inputContainer: kInputAccessoryView = {
        let view = kInputAccessoryView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputContainer.delegate = self
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override var inputAccessoryView: UIView? {
        return inputContainer
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        contentLabel.text = inputContainer.text
        inputAccessoryView?.resignFirstResponder()
    }
}

extension ViewController: kInputAccessoryViewDelegate {
    func accessoryViewShouldReturn(_ view: kInputAccessoryView, text: String?) {
        contentLabel.text = text
    }
}
