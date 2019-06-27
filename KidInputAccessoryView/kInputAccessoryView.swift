//
//  kInputAccessoryView.swift
//  KidInputAccessoryView
//
//  Created by Kid Tsui on 2019/6/27.
//  Copyright © 2019 Kid Tsui. All rights reserved.
//

import UIKit

protocol kInputAccessoryViewDelegate {
    func accessoryViewShouldReturn(_ view: kInputAccessoryView, text: String?)
}

class kInputAccessoryView: UIView {
    
    private var inputTextField: UITextField!
    var text: String? {
        return inputTextField.text
    }
    var delegate: kInputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        inputTextField = UITextField(frame: .zero)//CGRect(x: 20, y: 10, width: frame.width - 50, height: 30))
        inputTextField.backgroundColor = .white
        inputTextField.delegate = self
        
        // NOTICE: when adding constraints manually, you MUST set `translatesAutoresizingMaskIntoConstraints` equal to false, or it would do as its NAME, translates Autoresizing Mask Into Constrain.
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // NOTICE: Before setting the constrains, you MUST do addSubview() first
        addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        inputTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 30)
        inputTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 25.0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var canBecomeFirstResponder: Bool {
        
        return true
    }
    
    
    /**
     I faced a problem that it would show the warning message below everytime when I call `inputTextField.resignFirstResponder()`,
     but I can't find out a good solution to solve this warning.
     
     If someone had faced the some problem and solved it successfully, please teach me, I would appreciate it very much.
     my mail is kid@csie.io
     
     """
     KidInputAccessoryView[97971:3770390] [View] First responder warning: '<KidInputAccessoryView.kInputAccessoryView: 0x7fd9e2d1c2a0; frame = (0 0; 414 100); layer = <CALayer: 0x600003eb48a0>>' rejected resignFirstResponder when being removed from hierarchy
     """
     */
    override func resignFirstResponder() -> Bool {
        return inputTextField.resignFirstResponder()
    }
}

extension kInputAccessoryView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.accessoryViewShouldReturn(self, text: textField.text)
        textField.text = nil

        return resignFirstResponder()
    }
//
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
}
