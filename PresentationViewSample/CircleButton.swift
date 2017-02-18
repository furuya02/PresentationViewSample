//
//  CircleButton.swift
//  PresentationViewSample
//
//  Created by hirauchi.shinichi on 2017/02/18.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15.0 {
        didSet{
            setupView()
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.blue {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 3.0 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }

    // ボタンが押されている間は、ボーダーのalpha値を下げる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        layer.borderColor = borderColor.withAlphaComponent(0.2).cgColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        layer.borderColor = borderColor.cgColor
    }
}
