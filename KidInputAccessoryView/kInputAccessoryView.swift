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
    
    private let kInputTextFieldHeight: CGFloat = 30
    private let inputTextField = UITextField()
    
    var text: String? {
        return inputTextField.text
    }
    var delegate: kInputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        addSubview(inputTextField)
        inputTextField.backgroundColor = .white
        
        // NOTICE: when adding constraints manually, you MUST set `translatesAutoresizingMaskIntoConstraints` equal to false, or it would do as its NAME, translates Autoresizing Mask Into Constrain.
        translatesAutoresizingMaskIntoConstraints = false
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        inputTextField.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        inputTextField.heightAnchor.constraint(equalToConstant: kInputTextFieldHeight).isActive = true
        inputTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        inputTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        inputTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    // don't know why after override this method, inputTextField.heightAnchor finally works?
    override var intrinsicContentSize: CGSize {
        return .zero
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
    @discardableResult
    override func resignFirstResponder() -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    
    @discardableResult
    func canBecomeFirstResponder() -> Bool {
        return inputTextField.canBecomeFirstResponder
    }
    
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        return inputTextField.becomeFirstResponder()
    }
}

extension kInputAccessoryView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.accessoryViewShouldReturn(self, text: textField.text)
        textField.text = nil
        
        return textField.resignFirstResponder()
    }
}
